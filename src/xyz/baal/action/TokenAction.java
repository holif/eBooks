package xyz.baal.action;

import java.io.IOException;

import xyz.baal.util.GetToken;

public class TokenAction {
	private String token;

	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	public String execute() throws IOException{

		token = GetToken.getTokens();

		return "success";
	}
}
