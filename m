Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 28AF969D2CA
	for <lists+cluster-devel@lfdr.de>; Mon, 20 Feb 2023 19:36:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676918179;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=+BQMVtEdSqE57prMMKR11VCTUBB3gnlcS/QDAiHyCC0=;
	b=MkoAJoqRM76TVeDQcq1RC6jcxJvp2xwd1mko8iwLuqjnLDs8N3Wk9/FphbwywNzt9YT8Nu
	W8jS6dLf7B/FPlkG3Q5HuDnq3IG5a74KRDqflRkp5fRG88pPKPskNReFGsdLeq+fTunz32
	yZMGcxyhkPNudhOHKiCVnlyDD2/oCEw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-504-ppKZ90zTOjmOfoiIjGan4Q-1; Mon, 20 Feb 2023 13:36:17 -0500
X-MC-Unique: ppKZ90zTOjmOfoiIjGan4Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2AFE7802C18;
	Mon, 20 Feb 2023 18:36:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5EE4A400EA89;
	Mon, 20 Feb 2023 18:36:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8A2E21946589;
	Mon, 20 Feb 2023 18:36:14 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8D6E91946586 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 20 Feb 2023 18:36:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7A81D400EA89; Mon, 20 Feb 2023 18:36:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from redhat.com (null.msp.redhat.com [10.15.80.136])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F79240B40E4;
 Mon, 20 Feb 2023 18:36:13 +0000 (UTC)
Date: Mon, 20 Feb 2023 12:36:11 -0600
From: David Teigland <teigland@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20230220183611.GA11414@redhat.com>
MIME-Version: 1.0
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: [Cluster-devel] [GIT PULL] dlm updates for 6.3
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please pull dlm updates from tag:

git://git.kernel.org/pub/scm/linux/kernel/git/teigland/linux-dlm.git dlm-6.3

This patch set fixes some races in the lowcomms startup and shutdown code
that were found by targetted stress testing that quickly and repeatedly
joins and leaves lockspaces.

Thanks,
Dave

Alexander Aring (15):
      fs: dlm: start midcomms before scand
      fs: dlm: fix use after free in midcomms commit
      fs: dlm: be sure to call dlm_send_queue_flush()
      fs: dlm: fix race setting stop tx flag
      fs: dlm: don't set stop rx flag after node reset
      fs: dlm: move sending fin message into state change handling
      fs: dlm: send FIN ack back in right cases
      fs: dlm: bring back previous shutdown handling
      fs: dlm: ignore unexpected non dlm opts msgs
      fs: dlm: wait until all midcomms nodes detect version
      fs: dlm: make dlm sequence id more robust
      fs: dlm: reduce the shutdown timeout to 5 secs
      fs: dlm: remove newline in log_print
      fs: dlm: move state change into else branch
      fs: dlm: remove unnecessary waker_up() calls

Paul E. McKenney (1):
      fs/dlm: Remove "select SRCU"

Yang Yingliang (1):
      fs: dlm: fix return value check in dlm_memory_init()


 fs/dlm/Kconfig     |   1 -
 fs/dlm/lockspace.c |  21 +++++----
 fs/dlm/lowcomms.c  |  77 ++++++++++++++++++++++---------
 fs/dlm/memory.c    |   2 +-
 fs/dlm/midcomms.c  | 131 +++++++++++++++++++++++++++--------------------------
 fs/dlm/midcomms.h  |   1 +
 6 files changed, 136 insertions(+), 97 deletions(-)

