Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 620BA14E7CE
	for <lists+cluster-devel@lfdr.de>; Fri, 31 Jan 2020 05:16:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580444177;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9qv/9IY7z1cb3KaU+8YnHQY9ytlWic/0bk2pg6VAcKo=;
	b=dPg3k58M2BM0o+Rg/otGBEh2x/mInqd2m7GYq7/AfRiVZzm51GkUvb6gEoMRfW5Swspzpi
	EGtEIH3VIWjabuCnKT9gGCMdnJ4V7+5a3e3lTy75FWOaz1BV53qWt1yokXypDW4+Fv7IWG
	PAp42+ds19XUbZg5N90yqvjb7hC6D+I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-VpP9oLfHNgKQF9I2AjHupQ-1; Thu, 30 Jan 2020 23:16:15 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 473D38018AE;
	Fri, 31 Jan 2020 04:16:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F51588846;
	Fri, 31 Jan 2020 04:16:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7334618089C8;
	Fri, 31 Jan 2020 04:16:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00V4FptG022075 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 30 Jan 2020 23:15:51 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B83442166B29; Fri, 31 Jan 2020 04:15:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B3ADF2166B27
	for <cluster-devel@redhat.com>; Fri, 31 Jan 2020 04:15:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AD53B804C6D
	for <cluster-devel@redhat.com>; Fri, 31 Jan 2020 04:15:49 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-231-knDuLPH6OWOD0INJiFmKrg-1;
	Thu, 30 Jan 2020 23:15:47 -0500
Received: from localhost (unknown [148.87.23.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 72D6E2067C;
	Fri, 31 Jan 2020 04:07:55 +0000 (UTC)
Date: Thu, 30 Jan 2020 20:07:53 -0800
From: "Darrick J. Wong" <djwong@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20200131040753.GB6869@magnolia>
MIME-Version: 1.0
User-Agent: Mutt/1.9.4 (2018-02-28)
X-MC-Unique: knDuLPH6OWOD0INJiFmKrg-1
X-MC-Unique: VpP9oLfHNgKQF9I2AjHupQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00V4FptG022075
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, david@fromorbit.com,
	Theodore Ts'o <tytso@mit.edu>,
	"Darrick J. Wong" <djwong@kernel.org>, sandeen@sandeen.net,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-ext4 <linux-ext4@vger.kernel.org>, hch@lst.de
Subject: [Cluster-devel] [GIT PULL] iomap: new code for 5.6
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi Linus,

Please pull this set of new code for 5.6.  There's a single patch fixing
an off-by-one error when we're checking to see how far we're gotten into
an EOF page.

--D

The following changes since commit fd6988496e79a6a4bdb514a4655d2920209eb85d=
:

  Linux 5.5-rc4 (2019-12-29 15:29:16 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git tags/iomap-5.6-merge-3

for you to fetch changes up to 243145bc4336684c69f95de0a303b31f2e5bf264:

  fs: Fix page_mkwrite off-by-one errors (2020-01-06 08:58:23 -0800)

----------------------------------------------------------------
New code for 5.6:
- Fix an off-by-one error when checking if offset is within inode size

----------------------------------------------------------------
Andreas Gruenbacher (1):
      fs: Fix page_mkwrite off-by-one errors

 fs/iomap/buffered-io.c  | 18 +++++-------------
 include/linux/pagemap.h | 28 ++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+), 13 deletions(-)


