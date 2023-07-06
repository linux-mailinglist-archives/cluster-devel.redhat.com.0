Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 88553749293
	for <lists+cluster-devel@lfdr.de>; Thu,  6 Jul 2023 02:25:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688603103;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wQrrvEHrdEq+osTW0Wr8kVu0f7U04IZLxlzz6yfy6qI=;
	b=QXwhzZzjRzvquQE5fr1bSkU8jKzXX5osOHKg4hro0DKR0bQAxfeVQRzR/mgcrHEHUOSSdv
	2F+YnNXZT4t2FD3T1yTRsB96TVlrdOKNyQ0jEDArNKyoPZUabqyAaGJTEebozf+5gQJClR
	QSZiBWUfh4ATD+ivLmbuQw5GCN4mx4M=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-317-4LrBCZfSMuuh5sVrwHAM2Q-1; Wed, 05 Jul 2023 20:25:00 -0400
X-MC-Unique: 4LrBCZfSMuuh5sVrwHAM2Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 49CA13C0BE23;
	Thu,  6 Jul 2023 00:24:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BF661C478DD;
	Thu,  6 Jul 2023 00:24:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7F34519465A0;
	Thu,  6 Jul 2023 00:24:58 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1FB581946588 for <cluster-devel@listman.corp.redhat.com>;
 Thu,  6 Jul 2023 00:24:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 005F3F6403; Thu,  6 Jul 2023 00:24:58 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ED8ECF5CFB
 for <cluster-devel@redhat.com>; Thu,  6 Jul 2023 00:24:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D131F803FDF
 for <cluster-devel@redhat.com>; Thu,  6 Jul 2023 00:24:57 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-106-r7GLYFrGPVWpIK-QF-sTpg-1; Wed, 05 Jul 2023 20:24:53 -0400
X-MC-Unique: r7GLYFrGPVWpIK-QF-sTpg-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 721D36178F;
 Thu,  6 Jul 2023 00:18:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B6755C433C9;
 Thu,  6 Jul 2023 00:18:14 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 91A30C40C5E; Thu,  6 Jul 2023 00:18:14 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <168860269459.29151.8627542432532930093.git-patchwork-notify@kernel.org>
Date: Thu, 06 Jul 2023 00:18:14 +0000
References: <20230601145904.1385409-2-hch@lst.de>
In-Reply-To: <20230601145904.1385409-2-hch@lst.de>
To: Christoph Hellwig <hch@lst.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [Cluster-devel] [f2fs-dev] [PATCH 01/12] backing_dev: remove
 current->backing_dev_info
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
Cc: djwong@kernel.org, linux-mm@kvack.org, miklos@szeredi.hu,
 willy@infradead.org, cluster-devel@redhat.com, idryomov@gmail.com,
 linux-ext4@vger.kernel.org, brauner@kernel.org, linux-block@vger.kernel.org,
 dlemoal@kernel.org, viro@zeniv.linux.org.uk, jaegeuk@kernel.org,
 ceph-devel@vger.kernel.org, xiubli@redhat.com, trond.myklebust@hammerspace.com,
 axboe@kernel.dk, linux-nfs@vger.kernel.org, tytso@mit.edu,
 johannes.thumshirn@wdc.com, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, anna@kernel.org, linux-fsdevel@vger.kernel.org,
 akpm@linux-foundation.org, hare@suse.de
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Andrew Morton <akpm@linux-foundation.org>:

On Thu,  1 Jun 2023 16:58:53 +0200 you wrote:
> The last user of current->backing_dev_info disappeared in commit
> b9b1335e6403 ("remove bdi_congested() and wb_congested() and related
> functions").  Remove the field and all assignments to it.
>=20
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Christian Brauner <brauner@kernel.org>
> Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
> Reviewed-by: Hannes Reinecke <hare@suse.de>
> Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
> Reviewed-by: Darrick J. Wong <djwong@kernel.org>
> Acked-by: Theodore Ts'o <tytso@mit.edu>
>=20
> [...]

Here is the summary with links:
  - [f2fs-dev,01/12] backing_dev: remove current->backing_dev_info
    https://git.kernel.org/jaegeuk/f2fs/c/0d625446d0a4
  - [f2fs-dev,02/12] iomap: update ki_pos a little later in iomap_dio_compl=
ete
    https://git.kernel.org/jaegeuk/f2fs/c/936e114a245b
  - [f2fs-dev,03/12] filemap: update ki_pos in generic_perform_write
    https://git.kernel.org/jaegeuk/f2fs/c/182c25e9c157
  - [f2fs-dev,04/12] filemap: add a kiocb_write_and_wait helper
    https://git.kernel.org/jaegeuk/f2fs/c/3c435a0fe35c
  - [f2fs-dev,05/12] filemap: add a kiocb_invalidate_pages helper
    https://git.kernel.org/jaegeuk/f2fs/c/e003f74afbd2
  - [f2fs-dev,06/12] filemap: add a kiocb_invalidate_post_direct_write help=
er
    https://git.kernel.org/jaegeuk/f2fs/c/c402a9a9430b
  - [f2fs-dev,07/12] iomap: update ki_pos in iomap_file_buffered_write
    https://git.kernel.org/jaegeuk/f2fs/c/219580eea1ee
  - [f2fs-dev,08/12] iomap: use kiocb_write_and_wait and kiocb_invalidate_p=
ages
    https://git.kernel.org/jaegeuk/f2fs/c/8ee93b4bb626
  - [f2fs-dev,09/12] fs: factor out a direct_write_fallback helper
    https://git.kernel.org/jaegeuk/f2fs/c/44fff0fa08ec
  - [f2fs-dev,10/12] fuse: update ki_pos in fuse_perform_write
    https://git.kernel.org/jaegeuk/f2fs/c/70e986c3b4f4
  - [f2fs-dev,11/12] fuse: drop redundant arguments to fuse_perform_write
    https://git.kernel.org/jaegeuk/f2fs/c/596df33d673d
  - [f2fs-dev,12/12] fuse: use direct_write_fallback
    https://git.kernel.org/jaegeuk/f2fs/c/64d1b4dd826d

You are awesome, thank you!
--=20
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


