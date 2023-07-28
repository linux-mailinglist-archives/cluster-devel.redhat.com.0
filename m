Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 90699766B3A
	for <lists+cluster-devel@lfdr.de>; Fri, 28 Jul 2023 13:01:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690542079;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=yheC9r7s+czUNowCGT5g2iKjJ1cPgKDSxNW31ZLnhIA=;
	b=FwVan0E5OuXVvb/CaauBgKfbKCuLc9l3ZSPgcN4OJpN25/+ejLIlKFz8FzlBXPU1yTtvcn
	0vbXIw5/ceXAnONA3gLnihZLFtaWSWlb1F/x8OUEZfc0ocf66Z0G0itRmXty1OCl6knVPm
	80/y0F2+lMZtHIGXfsU1NKANPxGXg4g=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-330-suHVqLznMsicyw_NX63EPg-1; Fri, 28 Jul 2023 07:01:16 -0400
X-MC-Unique: suHVqLznMsicyw_NX63EPg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2375C1C09A47;
	Fri, 28 Jul 2023 11:01:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 133242166B25;
	Fri, 28 Jul 2023 11:01:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B7EB21946A6E;
	Fri, 28 Jul 2023 11:01:13 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 95FE21946586 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 28 Jul 2023 11:01:12 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4D79E1454147; Fri, 28 Jul 2023 11:01:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4489A1454145
 for <cluster-devel@redhat.com>; Fri, 28 Jul 2023 11:01:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 249CF86F123
 for <cluster-devel@redhat.com>; Fri, 28 Jul 2023 11:01:12 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-13-mo3pdkcRON-NTP9-Oae3-A-1; Fri, 28 Jul 2023 07:01:06 -0400
X-MC-Unique: mo3pdkcRON-NTP9-Oae3-A-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 70293620F0;
 Fri, 28 Jul 2023 11:01:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71689C433C8;
 Fri, 28 Jul 2023 11:00:49 +0000 (UTC)
From: Christian Brauner <brauner@kernel.org>
To: Jeff Layton <jlayton@kernel.org>
Date: Fri, 28 Jul 2023 13:00:37 +0200
Message-Id: <20230728-unrecht-ersichtlich-cfa7d0c703d1@brauner>
In-Reply-To: <20230725-mgctime-v6-0-a794c2b7abca@kernel.org>
References: <20230725-mgctime-v6-0-a794c2b7abca@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1874; i=brauner@kernel.org;
 h=from:subject:message-id; bh=4DjYiXolHUh8qQu1N+OzbWT4vtvmgyT4c+N7Ht8XGtY=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMaQcnsy9IaFu+ZP9z1N8rj/+PH2Pm5FLY6hTmXAw+6xpv069
 EIk93lHKwiDGxSArpsji0G4SLrecp2KzUaYGzBxWJpAhDFycAjARMyFGhh2xp3MqP+WJ6kre7E0z/m
 vxVuf2tOrqbz/KOXZnbdld4czI8C9ly15G/weVYRsOZM6bEHF4077Al0vcwkM2vDFrTz89nQsA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [Cluster-devel] (subset) [PATCH v6 0/7] fs: implement
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
Cc: Latchesar Ionkov <lucho@ionkov.net>,
 Martin Brandenburg <martin@omnibond.com>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Joseph Qi <joseph.qi@linux.alibaba.com>, "Darrick J. Wong" <djwong@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 Dave Chinner <david@fromorbit.com>, David Howells <dhowells@redhat.com>,
 linux-mm@kvack.org, linux-mtd@lists.infradead.org,
 Hans de Goede <hdegoede@redhat.com>, Marc Dionne <marc.dionne@auristor.com>,
 Steve French <sfrench@samba.org>, Tyler Hicks <code@tyhicks.com>,
 linux-afs@lists.infradead.org, Mike Marshall <hubcap@omnibond.com>,
 Paulo Alcantara <pc@manguebit.com>, linux-cifs@vger.kernel.org,
 Xiubo Li <xiubli@redhat.com>, Miklos Szeredi <miklos@szeredi.hu>,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 Ronnie Sahlberg <lsahlber@redhat.com>, Hugh Dickins <hughd@google.com>,
 Luis Chamberlain <mcgrof@kernel.org>, codalist@coda.cs.cmu.edu,
 cluster-devel@redhat.com, coda@cs.cmu.edu, Iurii Zaikin <yzaikin@google.com>,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 Namjae Jeon <linkinjeon@kernel.org>, devel@lists.orangefs.org,
 Shyam Prasad N <sprasad@microsoft.com>, Chao Yu <chao@kernel.org>,
 Kees Cook <keescook@chromium.org>, Anthony Iliopoulos <ailiop@suse.com>,
 ecryptfs@vger.kernel.org, linux-nfs@vger.kernel.org,
 Josef Bacik <josef@toxicpanda.com>, Tom Talpey <tom@talpey.com>,
 ocfs2-devel@lists.linux.dev, Yue Hu <huyue2@coolpad.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Eric Van Hensbergen <ericvh@kernel.org>, Gao Xiang <xiang@kernel.org>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Jan Harkes <jaharkes@cs.cmu.edu>,
 Christian Brauner <brauner@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>,
 Theodore Ts'o <tytso@mit.edu>, Chris Mason <clm@fb.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, v9fs@lists.linux.dev,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>, Tejun Heo <tj@kernel.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Jeffle Xu <jefflexu@linux.alibaba.com>, Anna Schumaker <anna@kernel.org>,
 Jan Kara <jack@suse.com>, linux-fsdevel@vger.kernel.org,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Andrew Morton <akpm@linux-foundation.org>, ntfs3@lists.linux.dev,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org,
 Joel Becker <jlbec@evilplan.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 25 Jul 2023 10:58:13 -0400, Jeff Layton wrote:
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

Survives xfstests (tmpfs, ext4, overlayfs) and the fs portions of LTP.
Let's keep our eyes open for any potential issues. Past suspects has
been IMA interacting with overlayfs. We'll see. Picked everything minus
the tmpfs-writepage patch that was contentious.

---

Applied to the vfs.ctime branch of the vfs/vfs.git tree.
Patches in the vfs.ctime branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: vfs.ctime

[1/7] fs: pass the request_mask to generic_fillattr
      https://git.kernel.org/vfs/vfs/c/0a6ab6dc6958
[2/7] fs: add infrastructure for multigrain timestamps
      https://git.kernel.org/vfs/vfs/c/d242b98ac3e9
[4/7] tmpfs: add support for multigrain timestamps
      https://git.kernel.org/vfs/vfs/c/1f31c58cf032
[5/7] xfs: switch to multigrain timestamps
      https://git.kernel.org/vfs/vfs/c/859dd91017dd
[6/7] ext4: switch to multigrain timestamps
      https://git.kernel.org/vfs/vfs/c/093af249eab4
[7/7] btrfs: convert to multigrain timestamps
      https://git.kernel.org/vfs/vfs/c/b90a04d1c30c

