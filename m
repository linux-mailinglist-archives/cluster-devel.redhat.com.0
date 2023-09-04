Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DD6791CB8
	for <lists+cluster-devel@lfdr.de>; Mon,  4 Sep 2023 20:20:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693851651;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1+YMJFCv7TW5RlAgUVriM8E2hxrJ3CkQYmnjoHY6RsM=;
	b=ekOjhPh5dVP7wmI0U78rNlwGfVXsHz3m7wJIrVMRhC56ZVv+g4tmtj+wn+la2iEYcrRxSy
	gMSeX8vJLXZckwl5wTYJ/U+iJG2jJeBmfGRD5sFZNEwo899g694lieiaVB8aFZ9PiWdnlY
	0Nbrn4j0INKE+NsAd4Vp4b5yr9uv/Ts=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-nfKL4zVZMYGOmED0oH8GeQ-1; Mon, 04 Sep 2023 14:20:47 -0400
X-MC-Unique: nfKL4zVZMYGOmED0oH8GeQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CE4951C060D0;
	Mon,  4 Sep 2023 18:20:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C187E403165;
	Mon,  4 Sep 2023 18:20:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9D03319465A3;
	Mon,  4 Sep 2023 18:20:46 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2B1D91946595 for <cluster-devel@listman.corp.redhat.com>;
 Mon,  4 Sep 2023 18:20:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 16703400F54; Mon,  4 Sep 2023 18:20:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0DC8B493114
 for <cluster-devel@redhat.com>; Mon,  4 Sep 2023 18:20:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E0101101A529
 for <cluster-devel@redhat.com>; Mon,  4 Sep 2023 18:20:44 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-673-zZIsTDXPN8ejKQDKyc5g-g-1; Mon, 04 Sep 2023 14:20:41 -0400
X-MC-Unique: zZIsTDXPN8ejKQDKyc5g-g-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 68C8D613F9;
 Mon,  4 Sep 2023 18:11:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C9A2DC433C8;
 Mon,  4 Sep 2023 18:11:08 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 A2BE4C04E26; Mon,  4 Sep 2023 18:11:08 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <169385106866.19669.14483196627780303129.git-patchwork-notify@kernel.org>
Date: Mon, 04 Sep 2023 18:11:08 +0000
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
In-Reply-To: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
To: Jeff Layton <jlayton@kernel.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [Cluster-devel] [f2fs-dev] [PATCH v7 00/13] fs: implement
 multigrain timestamps
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
Cc: lucho@ionkov.net, martin@omnibond.com,
 almaz.alexandrovich@paragon-software.com, jack@suse.cz,
 linux-xfs@vger.kernel.org, djwong@kernel.org, asmadeus@codewreck.org,
 linux_oss@crudebyte.com, ecryptfs@vger.kernel.org,
 linux-unionfs@vger.kernel.org, dhowells@redhat.com, clm@fb.com,
 adilger.kernel@dilger.ca, hdegoede@redhat.com, marc.dionne@auristor.com,
 codalist@coda.cs.cmu.edu, linux-afs@lists.infradead.org, hubcap@omnibond.com,
 pc@manguebit.com, linux-cifs@vger.kernel.org, ericvh@kernel.org,
 miklos@szeredi.hu, richard@nod.at, mark@fasheh.com, hughd@google.com,
 code@tyhicks.com, cluster-devel@redhat.com, coda@cs.cmu.edu,
 linux-mm@kvack.org, ntfs3@lists.linux.dev, idryomov@gmail.com,
 yzaikin@google.com, linkinjeon@kernel.org, trond.myklebust@hammerspace.com,
 sprasad@microsoft.com, amir73il@gmail.com, keescook@chromium.org,
 ocfs2-devel@lists.linux.dev, chao@kernel.org, josef@toxicpanda.com,
 tom@talpey.com, tj@kernel.org, huyue2@coolpad.com, viro@zeniv.linux.org.uk,
 ronniesahlberg@gmail.com, dsterba@suse.com, jaegeuk@kernel.org,
 ceph-devel@vger.kernel.org, xiubli@redhat.com, xiang@kernel.org,
 hirofumi@mail.parknet.co.jp, jaharkes@cs.cmu.edu, brauner@kernel.org,
 linux-ext4@vger.kernel.org, tytso@mit.edu, joseph.qi@linux.alibaba.com,
 gregkh@linuxfoundation.org, v9fs@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 sfrench@samba.org, senozhatsky@chromium.org, mcgrof@kernel.org,
 jefflexu@linux.alibaba.com, devel@lists.orangefs.org, anna@kernel.org,
 jack@suse.com, linux-mtd@lists.infradead.org, akpm@linux-foundation.org,
 sj1557.seo@samsung.com, linux-erofs@lists.ozlabs.org,
 linux-nfs@vger.kernel.org, linux-btrfs@vger.kernel.org, jlbec@evilplan.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Christian Brauner <brauner@kernel.org>:

On Mon, 07 Aug 2023 15:38:31 -0400 you wrote:
> The VFS always uses coarse-grained timestamps when updating the
> ctime and mtime after a change. This has the benefit of allowing
> filesystems to optimize away a lot metadata updates, down to around 1
> per jiffy, even when a file is under heavy writes.
>=20
> Unfortunately, this coarseness has always been an issue when we're
> exporting via NFSv3, which relies on timestamps to validate caches. A
> lot of changes can happen in a jiffy, so timestamps aren't sufficient to
> help the client decide to invalidate the cache.
>=20
> [...]

Here is the summary with links:
  - [f2fs-dev,v7,01/13] fs: remove silly warning from current_time
    https://git.kernel.org/jaegeuk/f2fs/c/b3030e4f2344
  - [f2fs-dev,v7,02/13] fs: pass the request_mask to generic_fillattr
    https://git.kernel.org/jaegeuk/f2fs/c/0d72b92883c6
  - [f2fs-dev,v7,03/13] fs: drop the timespec64 arg from generic_update_tim=
e
    https://git.kernel.org/jaegeuk/f2fs/c/541d4c798a59
  - [f2fs-dev,v7,04/13] btrfs: have it use inode_update_timestamps
    https://git.kernel.org/jaegeuk/f2fs/c/bb7cc0a62e47
  - [f2fs-dev,v7,05/13] fat: make fat_update_time get its own timestamp
    (no matching commit)
  - [f2fs-dev,v7,06/13] ubifs: have ubifs_update_time use inode_update_time=
stamps
    (no matching commit)
  - [f2fs-dev,v7,07/13] xfs: have xfs_vn_update_time gets its own timestamp
    (no matching commit)
  - [f2fs-dev,v7,08/13] fs: drop the timespec64 argument from update_time
    (no matching commit)
  - [f2fs-dev,v7,09/13] fs: add infrastructure for multigrain timestamps
    https://git.kernel.org/jaegeuk/f2fs/c/ffb6cf19e063
  - [f2fs-dev,v7,10/13] tmpfs: add support for multigrain timestamps
    https://git.kernel.org/jaegeuk/f2fs/c/d48c33972916
  - [f2fs-dev,v7,11/13] xfs: switch to multigrain timestamps
    (no matching commit)
  - [f2fs-dev,v7,12/13] ext4: switch to multigrain timestamps
    https://git.kernel.org/jaegeuk/f2fs/c/0269b585868e
  - [f2fs-dev,v7,13/13] btrfs: convert to multigrain timestamps
    https://git.kernel.org/jaegeuk/f2fs/c/50e9ceef1d4f

You are awesome, thank you!
--=20
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


