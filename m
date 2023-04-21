Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 407E36EB213
	for <lists+cluster-devel@lfdr.de>; Fri, 21 Apr 2023 21:07:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682104038;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sNEwfd4nTRCteHVweVe8SGAQgVcqbI8BcHRfILGmWCo=;
	b=Aw7Otv9RVx5pGq1IXslUMv7SfP+pbVYgXKjddKUDTyeNBkJuSUjYaApSRLmAp2VmcILsUh
	zv3jcyODCf6m1zIV2AoKViDvEHQPg4L9UnymIMaS5utspiZolVnb535VABPHg0qGlsKOwx
	tCjZcqiWVa0iutQKyT87Yh8NGPNtyDY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-493-CUKYE7HnM5OYtrh4O1aHeQ-1; Fri, 21 Apr 2023 15:07:16 -0400
X-MC-Unique: CUKYE7HnM5OYtrh4O1aHeQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 75964858289;
	Fri, 21 Apr 2023 19:07:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EE9AC40C2064;
	Fri, 21 Apr 2023 19:07:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 856E21946A4B;
	Fri, 21 Apr 2023 19:07:14 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C883919466DF for <cluster-devel@listman.corp.redhat.com>;
 Fri, 21 Apr 2023 19:07:12 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B77392026D25; Fri, 21 Apr 2023 19:07:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.users.net (unknown [10.2.16.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8B8AE2026D16
 for <cluster-devel@redhat.com>; Fri, 21 Apr 2023 19:07:12 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri, 21 Apr 2023 15:07:06 -0400
Message-Id: <20230421190710.397684-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: [Cluster-devel] [GFS2 PATCH 0/4] Fix revoke processing at unmount
 and ro
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
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: 8bit

This series of patches fixes a set of corner cases regarding how revokes are
handled during unmount and transitions to read-only. Return codes were
dropped, errors were not reported, and revokes were not written properly.

Bob Peterson (4):
  gfs2: return errors from gfs2_ail_empty_gl
  gfs2: Perform second log flush in gfs2_make_fs_ro
  gfs2: Issue message when revokes cannot be written
  gfs2: gfs2_ail_empty_gl no log flush on error

 fs/gfs2/glops.c | 23 ++++++++++++++---------
 fs/gfs2/super.c |  9 +++++++++
 2 files changed, 23 insertions(+), 9 deletions(-)

-- 
2.39.2

