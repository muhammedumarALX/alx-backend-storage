-- Creates a stored procedure ComputeAverageScoreForUser that computes and store the average score for a student

DROP PROCEDURE IF EXISTS ComputeAverageScoreForUser;
DELIMITER $$
CREATE PROCEDURE ComputeAverageScoreForUser(user_id INT)
BEGIN
	DECLARE total_score INT DEFAULT 0;
	DECLARE project_count INT DEFAULT 0;

	-- Compute the total score
	SELECT SUM(score) INTO total_score
	FROM corrections
	WHERE corrections.user_id = user_id;

	-- Compute project counts
	SELECT COUNT(*) INTO project_count
	FROM corrections
	WHERE corrections.user_id = user_id;

	-- Update the average score in the user table
	UPDATE users
	SET users.average_score = IF(
		project_count = 0,
		0,
		total_score / project_count
	)
	WHERE id = user_id;
END$$
DELIMITER ;
