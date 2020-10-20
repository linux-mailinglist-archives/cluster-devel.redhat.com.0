Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id D2EDD294446
	for <lists+cluster-devel@lfdr.de>; Tue, 20 Oct 2020 23:10:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1603228210;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hY1ly3umb1zfg825PpLsdO3Rs28jb/iF54QMePFN9tg=;
	b=erj8+jTci7Hf8eTW0Ph8VH7a+5ml+lc5xiY2S82vnLsZwcM0hH31kSKMmTlHKRztpcgXu/
	Du0etL/sC8al/tpZLLOn+1+BX8AyY2yrX6fyhOp24GfUnFFcixwiojO8teVOZJzNhJ/+G7
	BQEo0H6jkmdoR1yYc7I8xQR6pR4XBOk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-OmzLrRHpPgW7VChMjFyQNA-1; Tue, 20 Oct 2020 17:10:09 -0400
X-MC-Unique: OmzLrRHpPgW7VChMjFyQNA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75B791006C95;
	Tue, 20 Oct 2020 21:10:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 65FE56EF62;
	Tue, 20 Oct 2020 21:10:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4B576180B658;
	Tue, 20 Oct 2020 21:10:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09KLA39E005675 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 20 Oct 2020 17:10:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 28DFB7512A; Tue, 20 Oct 2020 21:10:03 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-119-138.rdu2.redhat.com [10.10.119.138])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AB94355785;
	Tue, 20 Oct 2020 21:10:02 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue, 20 Oct 2020 17:09:56 -0400
Message-Id: <20201020210957.1009638-3-aahringo@redhat.com>
In-Reply-To: <20201020210957.1009638-1-aahringo@redhat.com>
References: <20201020210957.1009638-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm/next 2/3] fs: dlm: constify addr_compare
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch just constify some function parameter which should be have a
read access only.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 9973293bfddcd..c23d794e82910 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -270,7 +270,8 @@ static struct dlm_node_addr *find_node_addr(int nodeid)
 	return NULL;
 }
 
-static int addr_compare(struct sockaddr_storage *x, struct sockaddr_storage *y)
+static int addr_compare(const struct sockaddr_storage *x,
+			const struct sockaddr_storage *y)
 {
 	switch (x->ss_family) {
 	case AF_INET: {
-- 
2.26.2

