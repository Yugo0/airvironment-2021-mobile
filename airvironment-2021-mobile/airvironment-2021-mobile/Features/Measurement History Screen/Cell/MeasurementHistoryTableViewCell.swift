//
//  MeasurementHistoryTableViewCell.swift
//  airvironment-2021-mobile
//
//  Created by Letnja Praksa 5 on 22.7.21..
//

import UIKit

class MeasurementHistoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var temperatureCellValue: UILabel!
    @IBOutlet weak var humidityCellValue: UILabel!
    @IBOutlet weak var pollutionCellValue: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(measurement: Measurement) {
        self.temperatureCellValue.text = String(measurement.temperature)
        self.humidityCellValue.text = String(measurement.humidity)
        self.pollutionCellValue.text = String(measurement.pollution)
    }
}

extension UITableViewCell {
    static func reusableIdentifier() -> String {
        String(describing: Self.self)
    }
}
