package com.example.Sweater.domain;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;

import org.hibernate.validator.constraints.Length;

@Entity
public class Message {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Long id;

    @NotBlank(message = "Please fill the message")
    @Length(max = 2048, message = "Message too long(more than 2kB)")
    private String text;
    @Length(max = 2048, message = "Tag too long(more than 255bt)")
    private String tag;

    @ManyToOne(fetch= FetchType.EAGER)
    @JoinColumn(name="user_id")
    private User author;
    private String filename;

    public String getAuthorName() {
        return author !=null ? author.getUsername(): "<none>";
    }

    public Long getId() {
        return id;
    }

    public String getText() {
        return text;
    }

    public String getTag() {
        return tag;
    }

    public User getAuthor() {
        return author;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setText(String text) {
        this.text = text;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public void setAuthor(User author) {
        this.author = author;
    }

    public String getFilename() {return filename;}

    public void setFilename(String filename) {this.filename = filename;}

    public Message() {
    }

    public Message(String text, String tag, User user) {
        this.text = text;
        this.tag = tag;
        this.author = user;

    }
}
