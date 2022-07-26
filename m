Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F8F5819DF
	for <lists+cluster-devel@lfdr.de>; Tue, 26 Jul 2022 20:40:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658860853;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rlzc8RrcbhYo1N1/OHMXbWZGXmGUhQ7FN9VTnFVMgSE=;
	b=VmHUxh5qXeMydbscYzeML1eLts04GWGG9FhXD6VvwfrZ4XpNNQdQ4BNhLo3v5twAKU0VS9
	e3ptJ7Ch9/q2n6XI7zzwDaNAxzI5HlOJqNCJIkMtbcOOYoILhouLiCx0nBLzB/1Bc9mxwm
	T4cqj5BnIplO6UaNvF233cGhWA/jHOU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-550-nsdNnxllNZmCwBv7KM2SHQ-1; Tue, 26 Jul 2022 14:40:46 -0400
X-MC-Unique: nsdNnxllNZmCwBv7KM2SHQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7E81D18E0043;
	Tue, 26 Jul 2022 18:40:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 72ACA1415118;
	Tue, 26 Jul 2022 18:40:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3FA141945D8F;
	Tue, 26 Jul 2022 18:40:45 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D32CE1945D86 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 26 Jul 2022 18:40:43 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B0A1B2026985; Tue, 26 Jul 2022 18:40:43 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 82A902026D64;
 Tue, 26 Jul 2022 18:40:43 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: rpeterso@redhat.com
Date: Tue, 26 Jul 2022 14:40:42 -0400
Message-Id: <20220726184042.1005918-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: [Cluster-devel] [PATCH RFC v2 dlm/next] fs: gfs2: do retry
 workaround on other dlm API calls
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch will do a retry on -EBUSY dlm API return value when it's not a
dlm_unlock() call with either DLM_LKF_CANCEL or DLM_LKF_FORCEUNLOCK. All
other API calls can occur a -EBUSY return value and the DLM user needs
to handle it as a retry again for now.

The reason why we need a -EBUSY in all other cases is because
dlm_recover_waiters_post() function in DLM. This function is happening
when dlm recovery recovers lock states. In some cases it will trigger
new lock requests as:

if (oc || ou) {
	...
} else {
	switch (mstype) {
	case DLM_MSG_LOOKUP:
	case DLM_MSG_REQUEST:
		_request_lock(r, lkb);
		if (is_master(r))
			confirm_master(r, 0);
		break;
	case DLM_MSG_CONVERT:
                _convert_lock(r, lkb);
                break;
        default:
		err = 1;
        }
}

The problem begins on what dlm recovery is doing afterwards. Those
requests are not synchronized and there could be pending messages around.
There exists a race between handling those messages, dlm unlocks dlm API
for accepting new dlm requests and the dlm user triggers new requests
immediate afterwards. If the DLM user triggers new requests it can clash
with the above requests triggered by DLM internally because the pending
messages are still around. This behaviour is unpredictable and the user
has only knowledge about it if new requests returning -EBUSY. For now we
need to add retry cases everywhere to retry lock requests if the above
race happens.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---

changes since v2:
 - fix fs/dlm to fs/gfs2 - sorry about that

 fs/gfs2/lock_dlm.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/lock_dlm.c b/fs/gfs2/lock_dlm.c
index 2559a79cf14b..5c2eba142e9e 100644
--- a/fs/gfs2/lock_dlm.c
+++ b/fs/gfs2/lock_dlm.c
@@ -519,8 +519,15 @@ static int sync_unlock(struct gfs2_sbd *sdp, struct dlm_lksb *lksb, char *name)
 	struct lm_lockstruct *ls = &sdp->sd_lockstruct;
 	int error;
 
+again:
 	error = dlm_unlock(ls->ls_dlm, lksb->sb_lkid, 0, lksb, ls);
-	if (error) {
+	switch (error) {
+	case 0:
+		break;
+	case -EBUSY:
+		msleep(20);
+		goto again;
+	default:
 		fs_err(sdp, "%s lkid %x error %d\n",
 		       name, lksb->sb_lkid, error);
 		return error;
@@ -546,10 +553,17 @@ static int sync_lock(struct gfs2_sbd *sdp, int mode, uint32_t flags,
 	memset(strname, 0, GDLM_STRNAME_BYTES);
 	snprintf(strname, GDLM_STRNAME_BYTES, "%8x%16x", LM_TYPE_NONDISK, num);
 
+again:
 	error = dlm_lock(ls->ls_dlm, mode, lksb, flags,
 			 strname, GDLM_STRNAME_BYTES - 1,
 			 0, sync_wait_cb, ls, NULL);
-	if (error) {
+	switch (error) {
+	case 0:
+		break;
+	case -EBUSY:
+		msleep(20);
+		goto again;
+	default:
 		fs_err(sdp, "%s lkid %x flags %x mode %d error %d\n",
 		       name, lksb->sb_lkid, flags, mode, error);
 		return error;
-- 
2.31.1

