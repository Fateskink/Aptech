package com.member;

import java.io.Serializable;

//^[T|V|A]{1}(MB|MT|MN)[\d]+$
public class Member implements Serializable {
    private String memberID;
    private String memberName;
    private String address;

    public Member() {}
    public Member(String memberID, String memberName, String address) {
        this.memberID = memberID;
        this.memberName = memberName;
        this.address = address;
    }

    @Override
    public String toString() {
        return "Member{" +
                "memberID='" + memberID + '\'' +
                ", memberName='" + memberName + '\'' +
                ", address='" + address + '\'' +
                '}';
    }

    public String getMemberID() {
        return memberID;
    }

    public void setMemberID(String memberID) {
        this.memberID = memberID;
    }

    public String getMemberName() {
        return memberName;
    }

    public void setMemberName(String memberName) {
        this.memberName = memberName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
