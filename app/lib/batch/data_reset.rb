class Batch::DataReset
	def self.data_reset
		#seedで作成したデータ以外を全て削除
		User.where.not(id: 1..4).delete_all
		Plant.where.not(id: 1..9).delete_all
	end
end