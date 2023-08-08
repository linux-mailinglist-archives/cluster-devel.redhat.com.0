Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D4B773A49
	for <lists+cluster-devel@lfdr.de>; Tue,  8 Aug 2023 14:53:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691499205;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dTX14N9/0e74HCqepsk/apUoVl7UMygGmrFkx9a+jkY=;
	b=jPYM3hHhPj6vpITPqydAeXd0qs6WbWBDFkEq4znVjYsMbSBfhYax7pHMi8ShScWcqRrlbo
	R1W0ZQlFHJu4KFuvYjGoDo+OG/LMK5xZc78CJGdvYN9LoMKhRDnm6nqrKeYfCj5P3pZ/OH
	oiRvhFAew3PbJXNmpj2bZ5AqlcQ+R2Y=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-672-LMnPVtPgNHimzIyAqFB1rw-1; Tue, 08 Aug 2023 08:53:22 -0400
X-MC-Unique: LMnPVtPgNHimzIyAqFB1rw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4F7AB1C07548;
	Tue,  8 Aug 2023 12:53:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DEBD840C2076;
	Tue,  8 Aug 2023 12:53:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 55C9E1946589;
	Tue,  8 Aug 2023 12:53:18 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D4DF41946587 for <cluster-devel@listman.corp.redhat.com>;
 Tue,  8 Aug 2023 12:53:17 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 86DEE2026D76; Tue,  8 Aug 2023 12:53:17 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from pasta.redhat.com (unknown [10.45.225.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B0DBE2026D4B;
 Tue,  8 Aug 2023 12:53:16 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue,  8 Aug 2023 14:53:15 +0200
Message-Id: <20230808125315.1727575-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: [Cluster-devel] [GIT PULL] gfs2 fixes
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
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Hi Linus,

please consider pulling the following two gfs2 fixes.

Thanks,
Andreas

The following changes since commit 94c76955e86a5a4f16a1d690b66dcc268c156e6a:

  Merge tag 'gfs2-v6.4-rc5-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2 (2023-07-04 11:45:16 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gfs2-v6.4-fixes

for you to fetch changes up to 0be8432166a61abc537e1247e530f4b85970b56b:

  gfs2: Don't use filemap_splice_read (2023-08-07 18:42:04 +0200)

----------------------------------------------------------------
gfs2 fixes

- Fix a freeze consistency check in gfs2_trans_add_meta().

- Don't use filemap_splice_read as it can cause deadlocks on gfs2.

----------------------------------------------------------------
Andreas Gruenbacher (1):
      gfs2: Fix freeze consistency check in gfs2_trans_add_meta

Bob Peterson (1):
      gfs2: Don't use filemap_splice_read

 fs/gfs2/file.c  |  4 ++--
 fs/gfs2/trans.c | 14 ++++++++++----
 2 files changed, 12 insertions(+), 6 deletions(-)

