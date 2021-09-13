Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id EE674409D1D
	for <lists+cluster-devel@lfdr.de>; Mon, 13 Sep 2021 21:31:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631561465;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wTn8f4lOdyVLpe7d68o8yeqKyUc+Jx0q1iureu0ejeg=;
	b=C68nL8kBLA1fxoIaIKBuGByLkVBONaUE64HfYORAovqIUUDJj/lPNKeIgP2xDIgJQNM3c0
	3/Wf1LcpLNJTgAsOG0C5j1EvbfOZSNE0031cQcQO7+nCZxsSFERqnWmcVjv+lADxhh+hgy
	36iPhOgeRiM/jyZLqqCneTAKDlbUeAA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-_jommBAZMJWJ6q6KtPf0Ag-1; Mon, 13 Sep 2021 15:31:03 -0400
X-MC-Unique: _jommBAZMJWJ6q6KtPf0Ag-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 60F7D180831E;
	Mon, 13 Sep 2021 19:31:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A81F6D983;
	Mon, 13 Sep 2021 19:31:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2A8434EA2A;
	Mon, 13 Sep 2021 19:31:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18DJUX23016761 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 13 Sep 2021 15:30:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CDFD95D9DD; Mon, 13 Sep 2021 19:30:33 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-80.phx2.redhat.com [10.3.112.80])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9D5CA5D9CA
	for <cluster-devel@redhat.com>; Mon, 13 Sep 2021 19:30:33 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Mon, 13 Sep 2021 14:30:26 -0500
Message-Id: <20210913193028.75116-3-rpeterso@redhat.com>
In-Reply-To: <20210913193028.75116-1-rpeterso@redhat.com>
References: <20210913193028.75116-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 2/4] gfs2: Add GL_SKIP holder flag to
	dump_holder
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Somehow the GL_SKIP flag was missed when dumping glock holders.
This patch adds it to function hflags2str. I added it at the end because
I wanted Holder and Skip flags together to read "Hs" rather than "sH"
to avoid confusion with "Shared" ("SH") holder state.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/glock.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index e0eaa9cf9fb6..6144d7fe28e6 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -2076,6 +2076,8 @@ static const char *hflags2str(char *buf, u16 flags, unsigned long iflags)
 		*p++ = 'H';
 	if (test_bit(HIF_WAIT, &iflags))
 		*p++ = 'W';
+	if (flags & GL_SKIP)
+		*p++ = 's';
 	*p = 0;
 	return buf;
 }
-- 
2.31.1

