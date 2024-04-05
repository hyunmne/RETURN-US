package dto;

public class Faq {
	private Integer faqNo;
	private String faqTitle;
	private String faqContent;
	
	public Faq() {}
	public Faq(String faqTitle, String faqContent) {
		super();
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
	}
	public Integer getFaqNo() {
		return faqNo;
	}
	public void setFaqNo(Integer faqNo) {
		this.faqNo = faqNo;
	}
	public String getFaqTitle() {
		return faqTitle;
	}
	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}
	public String getFaqContent() {
		return faqContent;
	}
	public void setFaqContent(String faqContent) {
		this.faqContent = faqContent;
	}

	
}
