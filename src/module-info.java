/**
 * 
 */
/**
 * 
 */
module tcm {
	requires jess;
	requires java.desktop;
	
	exports tcm;
	exports tcm.i18n;
	
	opens tcm.i18n to java.base;
}