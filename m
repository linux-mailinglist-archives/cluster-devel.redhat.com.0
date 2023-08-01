Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C79376BBF8
	for <lists+cluster-devel@lfdr.de>; Tue,  1 Aug 2023 20:10:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690913420;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Z4hRuZbnOZFG2ly69qwfNyw8BUk0pspssgojLuWZHY0=;
	b=Hpp7LKTWYhEIdNkURaYcWMBJTXhziv9iW0eCUyvLnjVSyl6Q5KiOblGP+IvCGUYdIPxq3a
	3S6OqMI/vcY1qxh29mZvUEyViUylBRiBfIe71l6eVvhhRrsHS2bNu3YwSRf5aV0ODpaRLs
	fnhlpQFbjfIRDIWyPhfKMfdtP8nqGB4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-YogQ0cVWNBaKiTJAj48YLw-1; Tue, 01 Aug 2023 14:10:18 -0400
X-MC-Unique: YogQ0cVWNBaKiTJAj48YLw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4E6EA887103;
	Tue,  1 Aug 2023 18:10:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EEB214A9004;
	Tue,  1 Aug 2023 18:10:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 07A891947210;
	Tue,  1 Aug 2023 18:10:14 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8DAC91947209 for <cluster-devel@listman.corp.redhat.com>;
 Tue,  1 Aug 2023 18:10:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 88961111F3DB; Tue,  1 Aug 2023 18:09:56 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 62A431121325;
 Tue,  1 Aug 2023 18:09:56 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue,  1 Aug 2023 14:09:50 -0400
Message-Id: <20230801180950.3693180-14-aahringo@redhat.com>
In-Reply-To: <20230801180950.3693180-1-aahringo@redhat.com>
References: <20230801180950.3693180-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: [Cluster-devel] [PATCHv2 dlm-next 13/13] fs: dlm: don't use
 RCOM_NAMES for version detection
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
Cc: cluster-devel@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Currently RCOM_STATUS and RCOM_NAMES inclusive their replies are being
used to determine the DLM version. The RCOM_NAMES messages are triggered
in DLM recovery when calling dlm_recover_directory() only. At this time
the DLM version need to be determined. I ran some tests and did not
expirenced some issues. When the DLM version detection was developed
probably I run once in a case of RCOM_NAMES and the version was not
detected yet. However it seems to be not necessary.

For backwards compatibility we still need to accept RCOM_NAMES messages
which are not protected regarding the DLM message reliability layer aka
stateless message. This patch changes that RCOM_NAMES we are sending out
after this patch are not stateless anymore.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/rcom.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/fs/dlm/rcom.c b/fs/dlm/rcom.c
index 6ab029149a1d..3b734aed26b5 100644
--- a/fs/dlm/rcom.c
+++ b/fs/dlm/rcom.c
@@ -308,15 +308,15 @@ static void receive_sync_reply(struct dlm_ls *ls, const struct dlm_rcom *rc_in)
 int dlm_rcom_names(struct dlm_ls *ls, int nodeid, char *last_name,
 		   int last_len, uint64_t seq)
 {
+	struct dlm_mhandle *mh;
 	struct dlm_rcom *rc;
-	struct dlm_msg *msg;
 	int error = 0;
 
 	ls->ls_recover_nodeid = nodeid;
 
 retry:
-	error = create_rcom_stateless(ls, nodeid, DLM_RCOM_NAMES, last_len,
-				      &rc, &msg, seq);
+	error = create_rcom(ls, nodeid, DLM_RCOM_NAMES, last_len,
+			    &rc, &mh, seq);
 	if (error)
 		goto out;
 	memcpy(rc->rc_buf, last_name, last_len);
@@ -324,7 +324,7 @@ int dlm_rcom_names(struct dlm_ls *ls, int nodeid, char *last_name,
 	allow_sync_reply(ls, &rc->rc_id);
 	memset(ls->ls_recover_buf, 0, DLM_MAX_SOCKET_BUFSIZE);
 
-	send_rcom_stateless(msg, rc);
+	send_rcom(mh, rc);
 
 	error = dlm_wait_function(ls, &rcom_response);
 	disallow_sync_reply(ls);
@@ -337,17 +337,17 @@ int dlm_rcom_names(struct dlm_ls *ls, int nodeid, char *last_name,
 static void receive_rcom_names(struct dlm_ls *ls, const struct dlm_rcom *rc_in,
 			       uint64_t seq)
 {
+	struct dlm_mhandle *mh;
 	struct dlm_rcom *rc;
 	int error, inlen, outlen, nodeid;
-	struct dlm_msg *msg;
 
 	nodeid = le32_to_cpu(rc_in->rc_header.h_nodeid);
 	inlen = le16_to_cpu(rc_in->rc_header.h_length) -
 		sizeof(struct dlm_rcom);
 	outlen = DLM_MAX_APP_BUFSIZE - sizeof(struct dlm_rcom);
 
-	error = create_rcom_stateless(ls, nodeid, DLM_RCOM_NAMES_REPLY, outlen,
-				      &rc, &msg, seq);
+	error = create_rcom(ls, nodeid, DLM_RCOM_NAMES_REPLY, outlen,
+			    &rc, &mh, seq);
 	if (error)
 		return;
 	rc->rc_id = rc_in->rc_id;
@@ -355,7 +355,7 @@ static void receive_rcom_names(struct dlm_ls *ls, const struct dlm_rcom *rc_in,
 
 	dlm_copy_master_names(ls, rc_in->rc_buf, inlen, rc->rc_buf, outlen,
 			      nodeid);
-	send_rcom_stateless(msg, rc);
+	send_rcom(mh, rc);
 }
 
 int dlm_send_rcom_lookup(struct dlm_rsb *r, int dir_nodeid, uint64_t seq)
-- 
2.31.1

