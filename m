Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 006E8526BCA
	for <lists+cluster-devel@lfdr.de>; Fri, 13 May 2022 22:48:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1652474906;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=i7D5DZu7DkQNOS0oP0ND9VVYMY7a2ICy+83x766pdrs=;
	b=WBgBM/EGP3vOIP/ymK0CjTZAiZjPKetOhylhafiCGDzNKuup7vDq6xq91HEf5mPw0coHRS
	lvDOQ8RrIVdql/diGmNfdn0AohreTPmqRWu01qIj+Osl45ENiSKZr8L29q5zC0juIbf7rh
	lJQVMyAQfw2Y/2UiOhFqYJyvaVpXHwQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-480-PEMD7PraMmyzaysoqcRXbg-1; Fri, 13 May 2022 16:48:20 -0400
X-MC-Unique: PEMD7PraMmyzaysoqcRXbg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B9DEA803D7C;
	Fri, 13 May 2022 20:48:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7122540CF8FB;
	Fri, 13 May 2022 20:48:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3F2A51932235;
	Fri, 13 May 2022 20:48:17 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5179D194975B for <cluster-devel@listman.corp.redhat.com>;
 Fri, 13 May 2022 20:48:16 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 25EB92024CB9; Fri, 13 May 2022 20:48:16 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.localdomain (unknown [10.40.194.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 934DC2026987;
 Fri, 13 May 2022 20:48:11 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Fri, 13 May 2022 22:48:03 +0200
Message-Id: <20220513204810.4123139-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: [Cluster-devel] [PATCH 0/7] gfs2 fixes
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Hello,

here's a bunch of fixes and related cleanups for the filesystem
corruption we've sometimes seen since commit 00bfe02f4796 ("gfs2: Fix
mmap + page fault deadlocks for buffered I/O").

Thanks,
Andreas

Andreas Gruenbacher (7):
  gfs2: Fix filesystem block deallocation for short writes
  gfs2: Variable rename
  gfs2: Clean up use of fault_in_iov_iter_{read,write}able
  gfs2: Pull return value test out of should_fault_in_pages
  gfs2: Align read and write chunks to the page cache
  gfs2: buffered write prefaulting
  gfs2: Stop using glock holder auto-demotion for now

 fs/gfs2/bmap.c |  11 ++--
 fs/gfs2/file.c | 139 ++++++++++++++++++++++---------------------------
 2 files changed, 68 insertions(+), 82 deletions(-)

-- 
2.35.1

