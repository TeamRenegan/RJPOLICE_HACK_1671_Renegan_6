const { google } = require("googleapis");


  const GOOGLE_SHEET_ID = process.env.GOOGLE_SHEET_ID;
  const GOOGLE_SHEET_NAME = process.env.GOOGLE_SHEET_NAME;
  const GOOGLE_CLIENT_EMAIL = process.env.GOOGLE_CLIENT_EMAIL;
  const GOOGLE_PRIVATE_KEY = process.env.GOOGLE_PRIVATE_KEY;


const sheets = google.sheets("v4");

const SCOPES = [
  "https://www.googleapis.com/auth/spreadsheets",
  "https://www.googleapis.com/auth/spreadsheets.readonly",
];

async function getAuthToken() {
  const auth = new google.auth.GoogleAuth({
    scopes: SCOPES,
    credentials: {
      client_email: GOOGLE_CLIENT_EMAIL,
      private_key: GOOGLE_PRIVATE_KEY,
    },
  });
  const authToken = await auth.getClient();
  return authToken;
}

async function getSpreadSheetValues() {
  const auth = await getAuthToken();
  const res = sheets.spreadsheets.values.get({
    auth,
    spreadsheetId: GOOGLE_SHEET_ID,
    range: GOOGLE_SHEET_NAME,
    majorDimension: "COLUMNS",
  });

  return res;
}

module.exports = {
  getSpreadSheetValues,
};