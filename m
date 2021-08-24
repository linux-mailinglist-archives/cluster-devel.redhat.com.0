Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id DA9633F5FC9
	for <lists+cluster-devel@lfdr.de>; Tue, 24 Aug 2021 16:03:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1629813777;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RwcCh6Kai8IFjfy/q2fckd0ZKc6dsxD76mjrdXjRbqg=;
	b=Zt0vwt8RPFA99SqZ/Yn9R7IFs32Ym7pTmXqiwE0Ed0EHMS+smN26oB7zIaj3xcCyRyJ20F
	VD6/wfx/+7Yj+UErGKN/5qk/eil02EBQGiHCmLBXKy5g7ROF+PYkLqhoOsEbxjDKSVxVtD
	ned24G7B1QI5mQRjlGhXADF80givoPI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-XGq_rPMoP2-twAcw0RRfpg-1; Tue, 24 Aug 2021 10:02:55 -0400
X-MC-Unique: XGq_rPMoP2-twAcw0RRfpg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E9FC61082926;
	Tue, 24 Aug 2021 14:02:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 92AD319CBA;
	Tue, 24 Aug 2021 14:02:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B580B181A1D3;
	Tue, 24 Aug 2021 14:02:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17OE2jel000444 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 24 Aug 2021 10:02:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 868CA60C82; Tue, 24 Aug 2021 14:02:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-114-176.phx2.redhat.com [10.3.114.176])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 54B5360C0F
	for <cluster-devel@redhat.com>; Tue, 24 Aug 2021 14:02:41 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Tue, 24 Aug 2021 09:02:38 -0500
Message-Id: <20210824140241.149386-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 0/3] gfs2: Fix freeze/thaw journal
	check problems
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

This patch set fixes some problems in which the freeze glock's glop
functions were not working as expected.

Bob Peterson (3):
  gfs2: switch go_xmote_bh glop to pass gh not gl
  gfs2: Fix broken freeze_go_xmote_bh
  gfs2: Eliminate go_xmote_bh in favor of go_lock

 fs/gfs2/glock.c      | 12 +-----------
 fs/gfs2/glops.c      | 40 +++++++++++++++++++++++++---------------
 fs/gfs2/incore.h     |  1 -
 fs/gfs2/ops_fstype.c |  5 +++--
 fs/gfs2/recovery.c   |  3 ++-
 fs/gfs2/super.c      | 34 ++++++++++++----------------------
 6 files changed, 43 insertions(+), 52 deletions(-)

-- 
2.31.1

