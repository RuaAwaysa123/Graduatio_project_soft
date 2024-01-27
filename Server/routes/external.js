const express = require('express');
const axios = require('axios');
const cheerio = require('cheerio');

const app = express();
const PORT = 3000;

// Define the endpoint to get room information based on faculty number
app.get('/getRoom/:facultyNumber', async (req, res) => {
  const facultyNumber = req.params.facultyNumber;

  try {
    // Fetch the HTML content of the Zajel website
    const response = await axios.get('https://zajelbs.najah.edu/servlet/ClaRomDir');
    const html = response.data;

    // Use cheerio to parse the HTML
    const $ = cheerio.load(html);

    // Extract room information based on faculty number
    const roomInfo = [];

    $('table tr').each((index, element) => {
      const columns = $(element).find('td');

      const currentFacultyNumber = $(columns[0]).text().trim();

      if (currentFacultyNumber === facultyNumber) {
        const room = $(columns[1]).text().trim();
        const building = $(columns[2]).text().trim();

        roomInfo.push({
          room,
          building,
        });
      }
    });

    // Send the room information as JSON
    res.json(roomInfo);
  } catch (error) {
    console.error('Error fetching data:', error.message);
    res.status(500).send('Internal Server Error');
  }
});


