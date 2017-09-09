using System;
using System.Collections.Generic;
using System.Text;
using System.Xml;
using DocumentFormat.OpenXml.Packaging;
using DocumentFormat.OpenXml.Spreadsheet;
using DocumentFormat.OpenXml;

namespace GpsGate.Samples.SOAP.Simple
{
    public class XLDocumentBuilder
    {
        /// <summary>
        /// Generates Excel file from xml Report response
        /// </summary>
        /// <param name="xmlRootNode">xml document with report data</param>
        /// <param name="destination">path for excel file</param>
        public static void Export(XmlNode xmlRootNode, string destination)
        {
            SpreadsheetDocument package = null;
            try
            {
                //Create excel file
                package = SpreadsheetDocument.Create(destination, DocumentFormat.OpenXml.SpreadsheetDocumentType.Workbook);
            }
            catch (Exception)
            {
                throw new System.IO.IOException(string.Format("File {0} is in use", destination));
            }

            using (package)
            {
                var workbookPart = package.AddWorkbookPart();
                package.WorkbookPart.Workbook = new Workbook();
                package.WorkbookPart.Workbook.Sheets = new Sheets();

                uint sheetId = 1;
                int colIndex = 0, rowIndex = 0;

                //Iterate each table in response, add sheet for it
                foreach (XmlNode xmlTableNode in xmlRootNode.ChildNodes[0].ChildNodes)
                {
                    var sheetPart = package.WorkbookPart.AddNewPart<WorksheetPart>();
                    var sheetData = new SheetData();
                    sheetPart.Worksheet = new Worksheet(sheetData);

                    Sheets sheets = package.WorkbookPart.Workbook.GetFirstChild<Sheets>();
                    string relationshipId = package.WorkbookPart.GetIdOfPart(sheetPart);

                    Sheet sheet = new Sheet() { Id = relationshipId, SheetId = sheetId, Name = "sheet_" + sheetId++ };
                    sheets.Append(sheet);

                    //Iterate each row in table and add row to worksheet 
                    foreach (XmlNode xmlRowNode in xmlTableNode.ChildNodes[1].ChildNodes)
                    {
                        colIndex = 0;
                        Row newRow = new Row();
                        //Iterate each cell in row, add cell to row in worksheet
                        foreach (XmlNode xmlCellNode in xmlRowNode.ChildNodes)
                        {
                            Cell cell = new Cell();
                            cell.DataType = new EnumValue<CellValues>(CellValues.String);
                            //set cell value to inner text in xml node
                            cell.CellValue = new CellValue(xmlCellNode.InnerText);
                            newRow.AppendChild(cell);
                            cell.CellReference = GetCellAddress(rowIndex, colIndex);
                            colIndex++;
                        }
                        sheetData.AppendChild(newRow);
                        rowIndex++;
                    }
                }
            }
        }
        /// <summary>
        /// Generate Cell Address from cell row and col
        /// This is necessary to set value of CellReference property
        /// of cell. With out the excel files don´t open open office
        /// </summary>
        /// <param name="row">row index</param>
        /// <param name="col">column index</param>
        /// <returns>cell address</returns>
        public static string GetCellAddress(int row, int col)
        {
            StringBuilder sb = new StringBuilder();
            do
            {
                sb.Insert(0, (char)('A' + (col % 26)));
                col /= 26;
            }
            while (col-- > 0);
            sb.Append(row + 1);
            return sb.ToString();
        }
    }
}
