Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 762354060EE
	for <lists+cluster-devel@lfdr.de>; Fri, 10 Sep 2021 02:22:41 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-pk-DZra4NzKi4hOGWv25gQ-1; Thu, 09 Sep 2021 20:22:39 -0400
X-MC-Unique: pk-DZra4NzKi4hOGWv25gQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D41210059AB;
	Fri, 10 Sep 2021 00:22:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DB6126A901;
	Fri, 10 Sep 2021 00:22:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BCEDC1809C81;
	Fri, 10 Sep 2021 00:22:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18A0MIXb018009 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 9 Sep 2021 20:22:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7A4AD20519D5; Fri, 10 Sep 2021 00:22:18 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 741FE2157F49
	for <cluster-devel@redhat.com>; Fri, 10 Sep 2021 00:22:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8C83B800B29
	for <cluster-devel@redhat.com>; Fri, 10 Sep 2021 00:22:15 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-596-z9creS_ZOvKbD8wFuYwpMA-1;
	Thu, 09 Sep 2021 20:22:10 -0400
X-MC-Unique: z9creS_ZOvKbD8wFuYwpMA-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 742A16103E;
	Fri, 10 Sep 2021 00:22:08 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Thu,  9 Sep 2021 20:21:24 -0400
Message-Id: <20210910002143.175731-19-sashal@kernel.org>
In-Reply-To: <20210910002143.175731-1-sashal@kernel.org>
References: <20210910002143.175731-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: Sasha Levin <sashal@kernel.org>, cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH AUTOSEL 5.4 19/37] fs: dlm: fix return
	-EINTR on recovery stopped
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

From: Alexander Aring <aahringo@redhat.com>

[ Upstream commit aee742c9928ab4f5f4e0b00f41fb2d2cffae179e ]

This patch will return -EINTR instead of 1 if recovery is stopped. In
case of ping_members() the return value will be checked if the error is
-EINTR for signaling another recovery was triggered and the whole
recovery process will come to a clean end to process the next one.
Returning 1 will abort the recovery process and can leave the recovery
in a broken state.

It was reported with the following kernel log message attached and a gfs2
mount stopped working:

"dlm: bobvirt1: dlm_recover_members error 1"

whereas 1 was returned because of a conversion of "dlm_recovery_stopped()"
to an errno was missing which this patch will introduce. While on it all
other possible missing errno conversions at other places were added as
they are done as in other places.

It might be worth to check the error case at this recovery level,
because some of the functionality also returns -ENOBUFS and check why
recovery ends in a broken state. However this will fix the issue if
another recovery was triggered at some points of recovery handling.

Reported-by: Bob Peterson <rpeterso@redhat.com>
Signed-off-by: Alexander Aring <aahringo@redhat.com>
Signed-off-by: David Teigland <teigland@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/dlm/dir.c      | 4 +++-
 fs/dlm/member.c   | 4 +++-
 fs/dlm/recoverd.c | 4 +++-
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/fs/dlm/dir.c b/fs/dlm/dir.c
index 10c36ae1a8f9..45ebbe602bbf 100644
--- a/fs/dlm/dir.c
+++ b/fs/dlm/dir.c
@@ -85,8 +85,10 @@ int dlm_recover_directory(struct dlm_ls *ls)
 		for (;;) {
 			int left;
 			error = dlm_recovery_stopped(ls);
-			if (error)
+			if (error) {
+				error = -EINTR;
 				goto out_free;
+			}
 
 			error = dlm_rcom_names(ls, memb->nodeid,
 					       last_name, last_len);
diff --git a/fs/dlm/member.c b/fs/dlm/member.c
index 7ad83deb4505..bbb048a03e3e 100644
--- a/fs/dlm/member.c
+++ b/fs/dlm/member.c
@@ -433,8 +433,10 @@ static int ping_members(struct dlm_ls *ls)
 
 	list_for_each_entry(memb, &ls->ls_nodes, list) {
 		error = dlm_recovery_stopped(ls);
-		if (error)
+		if (error) {
+			error = -EINTR;
 			break;
+		}
 		error = dlm_rcom_status(ls, memb->nodeid, 0);
 		if (error)
 			break;
diff --git a/fs/dlm/recoverd.c b/fs/dlm/recoverd.c
index 85e245392715..97d052cea5a9 100644
--- a/fs/dlm/recoverd.c
+++ b/fs/dlm/recoverd.c
@@ -125,8 +125,10 @@ static int ls_recover(struct dlm_ls *ls, struct dlm_recover *rv)
 	dlm_recover_waiters_pre(ls);
 
 	error = dlm_recovery_stopped(ls);
-	if (error)
+	if (error) {
+		error = -EINTR;
 		goto fail;
+	}
 
 	if (neg || dlm_no_directory(ls)) {
 		/*
-- 
2.30.2

