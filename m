Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 4F6541101E2
	for <lists+cluster-devel@lfdr.de>; Tue,  3 Dec 2019 17:09:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575389359;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=iEjQHnJc5XptgyLvJB4UU1J8KBA05DrmpQDAmrm4uUs=;
	b=GgmMoPzJv7zJhpkLMATaefFTC5lINGSwTF2YoyLghstjuwPxHEV/uzrIKG7avAl8MfLSA9
	WMua+qdZxa/+dzlbSeVGl8hxSxMZeD5/8iMG91kS7NjlZHWmLrrPEbpwnIsST+BIzi1aJ7
	SrVB0l9LwPrXHxDp0SJDOQVUFq/34aI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-Si5MYBfpOOSg6Q22RQoS9g-1; Tue, 03 Dec 2019 11:09:18 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 830C8100550E;
	Tue,  3 Dec 2019 16:09:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 45AA661081;
	Tue,  3 Dec 2019 16:09:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7FC6B18089CD;
	Tue,  3 Dec 2019 16:09:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB3G99LG029074 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 3 Dec 2019 11:09:09 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id EEFDC10545EC; Tue,  3 Dec 2019 16:09:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E984210545E9
	for <cluster-devel@redhat.com>; Tue,  3 Dec 2019 16:09:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8027185A30D
	for <cluster-devel@redhat.com>; Tue,  3 Dec 2019 16:09:06 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-308-piyLLMIEO7aQu_oKVi1F0w-1;
	Tue, 03 Dec 2019 11:09:02 -0500
Received: from localhost (c-67-169-218-210.hsd1.or.comcast.net
	[67.169.218.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 1298720803;
	Tue,  3 Dec 2019 16:08:58 +0000 (UTC)
Date: Tue, 3 Dec 2019 08:08:56 -0800
From: "Darrick J. Wong" <djwong@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20191203160856.GC7323@magnolia>
MIME-Version: 1.0
User-Agent: Mutt/1.9.4 (2018-02-28)
X-MC-Unique: piyLLMIEO7aQu_oKVi1F0w-1
X-MC-Unique: Si5MYBfpOOSg6Q22RQoS9g-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xB3G99LG029074
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, david@fromorbit.com,
	Theodore Ts'o <tytso@mit.edu>,
	"Darrick J. Wong" <djwong@kernel.org>, sandeen@sandeen.net,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-ext4 <linux-ext4@vger.kernel.org>, hch@lst.de
Subject: [Cluster-devel] [GIT PULL] iomap: small cleanups for 5.5
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi Linus,

Please pull this series containing some more new iomap code for 5.5.
There's not much this time -- just removing some local variables that
don't need to exist in the iomap directio code.

The branch merges cleanly against this morning's HEAD and survived a few
days' worth of xfstests.  The merge was completely straightforward, so
please let me know if you run into anything weird(er than my dorky tag
message).

--D

The following changes since commit 419e9c38aa075ed0cd3c13d47e15954b686bcdb6=
:

  iomap: Fix pipe page leakage during splicing (2019-11-22 08:36:02 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git tags/iomap-5.5-merge-13

for you to fetch changes up to 88cfd30e188fcf6fd8304586c936a6f22fb665e5:

  iomap: remove unneeded variable in iomap_dio_rw() (2019-11-26 09:28:47 -0=
800)

----------------------------------------------------------------
New code for 5.5:
- Make iomap_dio_rw callers explicitly tell us if they want us to wait
- Port the xfs writeback code to iomap to complete the buffered io
  library functions
- Refactor the unshare code to share common pieces
- Add support for performing copy on write with buffered writes
- Other minor fixes
- Fix unchecked return in iomap_bmap
- Fix a type casting bug in a ternary statement in iomap_dio_bio_actor
- Improve tracepoints for easier diagnostic ability
- Fix pipe page leakage in directio reads
- Clean up iter usage in directio paths

----------------------------------------------------------------
Jan Kara (1):
      iomap: Do not create fake iter in iomap_dio_bio_actor()

Johannes Thumshirn (1):
      iomap: remove unneeded variable in iomap_dio_rw()

 fs/iomap/direct-io.c | 39 ++++++++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 17 deletions(-)


