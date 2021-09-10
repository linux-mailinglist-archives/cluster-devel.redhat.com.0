Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 752084060B9
	for <lists+cluster-devel@lfdr.de>; Fri, 10 Sep 2021 02:18:29 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-w_K1xEXlOeair5XprUs4cA-1; Thu, 09 Sep 2021 20:18:27 -0400
X-MC-Unique: w_K1xEXlOeair5XprUs4cA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D9731808301;
	Fri, 10 Sep 2021 00:18:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD60B100E107;
	Fri, 10 Sep 2021 00:18:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D48584E58E;
	Fri, 10 Sep 2021 00:18:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18A0IFGf017798 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 9 Sep 2021 20:18:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0E13410C6EDF; Fri, 10 Sep 2021 00:18:15 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 09AC810C7346
	for <cluster-devel@redhat.com>; Fri, 10 Sep 2021 00:18:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 26FAE831558
	for <cluster-devel@redhat.com>; Fri, 10 Sep 2021 00:18:03 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-594-bnIPT66MPeOt6mEn9DjJew-1;
	Thu, 09 Sep 2021 20:17:59 -0400
X-MC-Unique: bnIPT66MPeOt6mEn9DjJew-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 01DD1611C5;
	Fri, 10 Sep 2021 00:17:56 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Thu,  9 Sep 2021 20:15:45 -0400
Message-Id: <20210910001558.173296-86-sashal@kernel.org>
In-Reply-To: <20210910001558.173296-1-sashal@kernel.org>
References: <20210910001558.173296-1-sashal@kernel.org>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: Sasha Levin <sashal@kernel.org>, cluster-devel@redhat.com,
	Chris Mackowski <cmackows@redhat.com>
Subject: [Cluster-devel] [PATCH AUTOSEL 5.14 86/99] fs: dlm: avoid comms
	shutdown delay in release_lockspace
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

From: Alexander Aring <aahringo@redhat.com>

[ Upstream commit ecd95673142ef80169a6c003b569b8a86d1e6329 ]

When dlm_release_lockspace does active shutdown on connections to
other nodes, the active shutdown will wait for any exisitng passive
shutdowns to be resolved.  But, the sequence of operations during
dlm_release_lockspace can prevent the normal resolution of passive
shutdowns (processed normally by way of lockspace recovery.)
This disruption of passive shutdown handling can cause the active
shutdown to wait for a full timeout period, delaying the completion
of dlm_release_lockspace.

To fix this, make dlm_release_lockspace resolve existing passive
shutdowns (by calling dlm_clear_members earlier), before it does
active shutdowns.  The active shutdowns will not find any passive
shutdowns to wait for, and will not be delayed.

Reported-by: Chris Mackowski <cmackows@redhat.com>
Signed-off-by: Alexander Aring <aahringo@redhat.com>
Signed-off-by: David Teigland <teigland@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/dlm/lockspace.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
index d71aba8c3e64..e51ae83fc5b4 100644
--- a/fs/dlm/lockspace.c
+++ b/fs/dlm/lockspace.c
@@ -793,6 +793,7 @@ static int release_lockspace(struct dlm_ls *ls, int force)
 
 	if (ls_count == 1) {
 		dlm_scand_stop();
+		dlm_clear_members(ls);
 		dlm_midcomms_shutdown();
 	}
 
-- 
2.30.2

