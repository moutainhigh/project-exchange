package com.throne212.oa.test;

import java.io.FileInputStream;
import java.io.InputStream;

import jxl.Cell;
import jxl.CellType;
import jxl.Sheet;
import jxl.Workbook;

import com.throne212.oa.common.Util;
import com.throne212.oa.domain.report.WorkReport;

public class ExcelTest {

	public static void main(String[] args) throws Exception {

		InputStream fin = new FileInputStream("d:\\tmp\\report.xls");
		// Workbook workbook = Workbook.getWorkbook(fin);

		// Sheet sheet = workbook.getSheet(0);

		// Cell c71 = sheet.getCell("J7");
		//
		// System.out.println(c71.getContents());
		// System.out.println(c71.getType());

		// WorkReport report = new WorkReport();
		// fill(report,sheet,7,30);
		// printReport(report);

		WorkReport reportA1 = new WorkReport();
		WorkReport reportA2 = new WorkReport();
		WorkReport reportA3 = new WorkReport();
		WorkReport reportA4 = new WorkReport();

		WorkReport reportB1 = new WorkReport();
		WorkReport reportB2 = new WorkReport();
		WorkReport reportB3 = new WorkReport();
		WorkReport reportB4 = new WorkReport();
		WorkReport reportB5 = new WorkReport();
		WorkReport reportB6 = new WorkReport();
		WorkReport reportB7 = new WorkReport();

		WorkReport[][] arr = new WorkReport[][] { { reportA1, reportA2, reportA3, reportA4 }, { reportB1, reportB2, reportB3, reportB4, reportB5, reportB6, reportB7 } };

		fill(arr, fin);

		for (int i = 0; i < arr.length; i++) {
			for (int j = 0; j < arr[i].length; j++) {
				printReport(arr[i][j]);
			}
		}

		// workbook.close();

	}

	public static void fill(WorkReport[][] reports, InputStream is) throws Exception {
		Workbook workbook = Workbook.getWorkbook(is);
		Sheet sheet1 = workbook.getSheet(0);
		Sheet sheet2 = workbook.getSheet(1);

		fill(reports[0][0], sheet1, 7, 30);
		fill(reports[0][1], sheet1, 17, 20);
		fill(reports[0][2], sheet1, 34, 10);
		fill(reports[0][3], sheet1, 44, 18);

		fill(reports[1][0], sheet2, 11, 26);
		fill(reports[1][1], sheet2, 26, 23);
		fill(reports[1][2], sheet2, 42, 22);
		fill(reports[1][3], sheet2, 60, 25);
		fill(reports[1][4], sheet2, 77, 16);
		fill(reports[1][5], sheet2, 94, 15);
		fill(reports[1][6], sheet2, 105, 18);

		workbook.close();
	}

	public static void fill(WorkReport report, Sheet sheet, int row, int len) {
		for (int i = 0; i < len; i++) {
			Cell c = sheet.getCell(i, row - 1);
			if (c.getType() == CellType.NUMBER && !Util.isEmpty(c.getContents())) {
				Integer value = Integer.valueOf(c.getContents());
				report.setC(i + 1, value);
			}
		}
	}

	public static void printReport(WorkReport report) {
		for (int i = 1; i <= 30; i++) {
			System.out.print(report.getC(i) + ",");
		}
		System.out.println();
	}

}
