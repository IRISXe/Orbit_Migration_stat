const express = require('express');
const fs = require('fs');
const path = require('path');
const exec = require('child_process').exec;
require('dotenv').config();

const app = express();

// Set EJS as the templating engine
app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'));

app.use(express.static(path.join(__dirname, 'public')));


// Define the working directory where the batch file is located
const workingDirectory = path.join(__dirname, 'batchScript');

// Define the command to run the batch file
const command = "cmd /c run-sql.bat ${dbUser} ${dbPassword} ${dbConnectString}" ; //> commandOuttext.txt 2> commnderror.txt;

// Execute the command in the specified working directory

/*
exec(command, { cwd: workingDirectory }, (error, stdout, stderr) => {
  if (error) {
    console.error(exec error: ${error});
    return;
  }
  console.log(stdout: ${stdout});
  console.error(stderr: ${stderr});
  (async () => {
    console.log('Starting sleep 30 seconds...');
    await sleep(30000); // 30 seconds
    console.log('Sleep finished');
  })();
  
});
*/
// Sleep function to pause execution for a given number of milliseconds
const sleep = (ms) => new Promise(resolve => setTimeout(resolve, ms));

function executeCommandInterval(command, workingDirectory) {
  // This function executes your command
  const executeCommand = () => {
    exec(command, { cwd: workingDirectory }, (error, stdout, stderr) => {
      if (error) {
        console.error(`exec error: ${error}`);
        return;
      }
      (async () => {
        console.log('Starting sleep 30 seconds...');
        await sleep(30000); // 30 seconds
        console.log('Sleep finished');
      })();
      console.log(`stdout: ${stdout}`);
      console.error(`stderr: ${stderr}`);
    });
  };


  // Initial execution
  executeCommand();


  // Set interval to repeat every 90 seconds (90000 milliseconds)
  setInterval(() => {
    console.log('Starting execution after 90 seconds...');
    executeCommand();
  }, 90000);
}

executeCommandInterval(command, workingDirectory);
const readSqlFile = (fileName) => {
  const filePath = path.join(__dirname, 'batchScript', fileName);
  return fs.readFileSync(filePath, 'utf8');
};

// Fetch and cache data
let data1 = [];
let data2 = [];

const fetchData = async () => {
  try {
    // Read and parse the JSON files
    const jsonStringInp = readSqlFile('data1.json');
    const cleanedString = jsonStringInp.replace(/^\s+/, '').trim();
    const jsonString = cleanedString.replace(/_x0020_/g, ' ');
    const jsonData = JSON.parse(jsonString);

    const rows = jsonData.ROWSET.ROW;
    data1 = rows.map(row => {
      const values = Object.values(row); // Get all values from the row object
      return {
        ELEMENT: values[0], // First value will correspond to 'NAME'
        VALUE: values[1]    // Second value will correspond to 'CNT'
      };
    });

    const jsonStringInp2 = readSqlFile('data2.json');
    const cleanedString2 = jsonStringInp2.replace(/^\s+/, '').trim();
    const jsonString2 = cleanedString2.replace(/_x0020_/g, ' ');
    const jsonData2 = JSON.parse(jsonString2);

    const rows2 = jsonData2.ROWSET.ROW;
    data2 = rows2.map(row => {
      const values = Object.values(row); // Get all values from the row object
      return {
        ELEMENT: values[0], // First value will correspond to 'NAME'
        VALUE: values[1]    // Second value will correspond to 'CNT'
      };
    });

    console.log('Data refreshed');
  } catch (err) {
    console.error('Error fetching data:', err);
  }
};

// Fetch data initially
fetchData();

// Refresh data every 90 seconds (90000 milliseconds)
setInterval(fetchData, 90000);

// Route to fetch data and render the view
app.get('/', async (req, res) => {
  try {
    // Render the view with the cached data
    res.render('dashboard', { data1, data2 });
  } catch (err) {
    console.error('Error:', err);
    res.status(500).send('Server Error');
  }
});

// Route to fetch data as JSON
app.get('/data-json', (req, res) => {
  res.json( { data1, data2 });
});

app.listen(3001, () => {
  console.log('Server is running on http://localhost:3001');
});
