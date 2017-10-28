package view;

import com.jfinal.plugin.activerecord.Page;

import model.Symbol;

public class SymbolsJsonSerializer extends JsonSerializer<Symbol> {
	
	public SymbolsJsonSerializer(Symbol record) {
		super(record);
		this.rootName = "symbols";
	}
	
	public SymbolsJsonSerializer(Page<Symbol> records) {
		super(records);
		this.rootName = "symbols";
	}
	
	protected void loadAssociations(Symbol record, Boolean isFirst) {		
		if(isFirst){
			record.readAssociationValue();
		}
	}
}

