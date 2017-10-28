package view;

import com.jfinal.plugin.activerecord.Page;

import model.User;
import model.Transaction;

public class TransactionsJsonSerializer extends JsonSerializer<Transaction> {
	
	public TransactionsJsonSerializer(Transaction record) {
		super(record);
		this.rootName = "transactions";
	}
	
	public TransactionsJsonSerializer(Page<Transaction> records) {
		super(records);
		this.rootName = "transactions";
	}
	
	protected void loadAssociations(Transaction record, Boolean isFirst) {		
		if(isFirst){
			record.readAssociationValue();
		}
	}
}

