Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C147E7C4369
	for <lists+cluster-devel@lfdr.de>; Wed, 11 Oct 2023 00:05:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696975515;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2AMqunTsSyY5l7oJHOGnJLQkHHfoK+nmOjYPiFhLW9g=;
	b=DbLSuI8kgwZD66I+9NYVAd6SqTBHk6HpCFkQ9XNO0sPwRvd9XAlSn1JphxACWllePYrssU
	oiBmY/Tt9ZhEapmI6JWFXIQprvGl1VyaCIBUrex2p+6T+vdjVubIPO0j61uGGUAwl/XNyc
	0/OW9spGbiN3z3eePQ9f7Jz+ihQfNe4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-408-QYrs7AukOByHF4iLoEETkQ-1; Tue, 10 Oct 2023 18:05:01 -0400
X-MC-Unique: QYrs7AukOByHF4iLoEETkQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 885248F5DA3;
	Tue, 10 Oct 2023 22:05:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4968563F50;
	Tue, 10 Oct 2023 22:05:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 16AD819466E5;
	Tue, 10 Oct 2023 22:05:00 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9E5D51946597 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 10 Oct 2023 22:04:57 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8039663F50; Tue, 10 Oct 2023 22:04:57 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4DC0963F45;
 Tue, 10 Oct 2023 22:04:57 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue, 10 Oct 2023 18:04:42 -0400
Message-Id: <20231010220448.2978176-2-aahringo@redhat.com>
In-Reply-To: <20231010220448.2978176-1-aahringo@redhat.com>
References: <20231010220448.2978176-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: [Cluster-devel] [PATCH RESEND 2/8] fs: dlm: Fix the size of a
 buffer in dlm_create_debug_file()
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: cluster-devel@redhat.com, gfs2@lists.linux.dev,
 christophe.jaillet@wanadoo.fr, stable@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

8 is not the maximum size of the suffix used when creating debugfs files.

Let the compiler compute the correct size, and only give a hint about the
longest possible string that is used.

When building with W=1, this fixes the following warnings:

  fs/dlm/debug_fs.c: In function ‘dlm_create_debug_file’:
  fs/dlm/debug_fs.c:1020:58: error: ‘snprintf’ output may be truncated before the last format character [-Werror=format-truncation=]
   1020 |         snprintf(name, DLM_LOCKSPACE_LEN + 8, "%s_waiters", ls->ls_name);
        |                                                          ^
  fs/dlm/debug_fs.c:1020:9: note: ‘snprintf’ output between 9 and 73 bytes into a destination of size 72
   1020 |         snprintf(name, DLM_LOCKSPACE_LEN + 8, "%s_waiters", ls->ls_name);
        |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  fs/dlm/debug_fs.c:1031:50: error: ‘_queued_asts’ directive output may be truncated writing 12 bytes into a region of size between 8 and 72 [-Werror=format-truncation=]
   1031 |         snprintf(name, DLM_LOCKSPACE_LEN + 8, "%s_queued_asts", ls->ls_name);
        |                                                  ^~~~~~~~~~~~
  fs/dlm/debug_fs.c:1031:9: note: ‘snprintf’ output between 13 and 77 bytes into a destination of size 72
   1031 |         snprintf(name, DLM_LOCKSPACE_LEN + 8, "%s_queued_asts", ls->ls_name);
        |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fixes: 541adb0d4d10b ("fs: dlm: debugfs for queued callbacks")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/debug_fs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/dlm/debug_fs.c b/fs/dlm/debug_fs.c
index e9726c6cbdf2..c93359ceaae6 100644
--- a/fs/dlm/debug_fs.c
+++ b/fs/dlm/debug_fs.c
@@ -973,7 +973,8 @@ void dlm_delete_debug_comms_file(void *ctx)
 
 void dlm_create_debug_file(struct dlm_ls *ls)
 {
-	char name[DLM_LOCKSPACE_LEN + 8];
+	/* Reserve enough space for the longest file name */
+	char name[DLM_LOCKSPACE_LEN + sizeof("_queued_asts")];
 
 	/* format 1 */
 
-- 
2.39.3

