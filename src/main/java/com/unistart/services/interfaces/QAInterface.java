package com.unistart.services.interfaces;

import java.util.List;

import com.unistart.entities.QuestionAnswer;
import com.unistart.entities.QuestionTag;
import com.unistart.entities.Tag;

public interface QAInterface {

    Integer saveQa(String title, String contents, int type, int parentId, String username, int[] tags);

    QuestionAnswer getQaByUsername(int qaId, String username);

    List<QuestionAnswer> getAnswerOfQuestion(int questionId);

    List<QuestionAnswer> getAllQuestion();

    List<QuestionAnswer> getAllQuestionByUsername(String username);

    QuestionAnswer getQaByQaId(int qaId);

    void updateTotalVote(int qaId);

    void updateTotalReport(int qaId);

    int getTotalAnswerOfQuestion(int questionId);

    boolean updateQa(String title, String contents, int qaId, int userId);

    boolean changeStatusQuestionAnswer(int qaId, boolean status, boolean isActive);

    boolean saveTag(int id, int[] tagUni);

    boolean updateTag(int id, int[] tagUni);

    List<QuestionTag> getTagOfQuestion(int qaId);

    List<QuestionAnswer> listAllQuestionNeedAccept();

    int numberOfQuestionNeedAccept();

    List<QuestionAnswer> getAllReport();

    boolean changeReportStatus(int qaId, boolean status, boolean isActive);

    List<Tag> getAllTag();

    int numberOfReport();
}
