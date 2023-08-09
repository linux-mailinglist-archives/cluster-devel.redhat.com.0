Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 941797753B4
	for <lists+cluster-devel@lfdr.de>; Wed,  9 Aug 2023 09:10:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691565025;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=v1LVpjHznf0OlvDF3FzVWuD2mwHICbWcXIF4cYlakcg=;
	b=GG4/TlIrrZx+tengVDXewPLx7aVGxBjBd2mVl/pgS1ipYBlkJLtq3mzIfF/OMclp8Lp6Cl
	qMxm7pVvlxHBxcf9IuuyfF9A0v33McecutkQU/VAqeoPJtBGz2dfTuL5Y1rl67a0a4siB+
	XZ25joMcvEnRiB2L+QWKlDvmJ0siwjU=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-640-0ub8zYtiMdmqOWRfG3JKMA-1; Wed, 09 Aug 2023 03:10:21 -0400
X-MC-Unique: 0ub8zYtiMdmqOWRfG3JKMA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2863D3815F60;
	Wed,  9 Aug 2023 07:10:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 18B84492C13;
	Wed,  9 Aug 2023 07:10:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CEEB6194658F;
	Wed,  9 Aug 2023 07:10:19 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 916071946586 for <cluster-devel@listman.corp.redhat.com>;
 Wed,  9 Aug 2023 07:10:18 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7AE8F1121315; Wed,  9 Aug 2023 07:10:18 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 735CC1121314
 for <cluster-devel@redhat.com>; Wed,  9 Aug 2023 07:10:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2BBE480CD88
 for <cluster-devel@redhat.com>; Wed,  9 Aug 2023 07:10:18 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-w8Dm0CDeNSag61ypBlScsw-1; Wed, 09 Aug 2023 03:10:14 -0400
X-MC-Unique: w8Dm0CDeNSag61ypBlScsw-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 14B3762FBF;
 Wed,  9 Aug 2023 07:10:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 803F7C433C7;
 Wed,  9 Aug 2023 07:09:57 +0000 (UTC)
From: Christian Brauner <brauner@kernel.org>
To: Jeff Layton <jlayton@kernel.org>
Date: Wed,  9 Aug 2023 09:09:49 +0200
Message-Id: <20230809-neuigkeit-lahmgelegt-ec0ab744a2be@brauner>
In-Reply-To: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2693; i=brauner@kernel.org;
 h=from:subject:message-id; bh=+3Y6neJgMvW5vfedbEeRcP7JJepyGcWsyiFSr/HW990=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMaRctt58ofGmdrjT46zKic8e+j/qO6J62PGCzlmNRn/PL+ca
 DhW87ChlYRDjYpAVU2RxaDcJl1vOU7HZKFMDZg4rE8gQBi5OAZiIjiMjw77ybes4w5Z37p3j9lpveq
 1v7yzNZOVwx1cX83f9exixeQ8jw5qJVSkpYSKnLt8M6dl09qHqq/xjLU9j3pdUzg+b1x8izQ4A
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [Cluster-devel] [PATCH v7 00/13] fs: implement multigrain
 timestamps
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
 Jan Kara <jack@suse.cz>, Joseph Qi <joseph.qi@linux.alibaba.com>,
 "Darrick J. Wong" <djwong@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>, linux-kernel@vger.kernel.org,
 David Howells <dhowells@redhat.com>, linux-mm@kvack.org,
 linux-mtd@lists.infradead.org, Hans de Goede <hdegoede@redhat.com>,
 Marc Dionne <marc.dionne@auristor.com>, Steve French <sfrench@samba.org>,
 Tyler Hicks <code@tyhicks.com>, linux-afs@lists.infradead.org,
 Mike Marshall <hubcap@omnibond.com>, Paulo Alcantara <pc@manguebit.com>,
 linux-cifs@vger.kernel.org, Xiubo Li <xiubli@redhat.com>,
 Miklos Szeredi <miklos@szeredi.hu>, Richard Weinberger <richard@nod.at>,
 Mark Fasheh <mark@fasheh.com>, Hugh Dickins <hughd@google.com>,
 Luis Chamberlain <mcgrof@kernel.org>, codalist@coda.cs.cmu.edu,
 cluster-devel@redhat.com, coda@cs.cmu.edu, Iurii Zaikin <yzaikin@google.com>,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 Namjae Jeon <linkinjeon@kernel.org>, devel@lists.orangefs.org,
 Shyam Prasad N <sprasad@microsoft.com>, Chao Yu <chao@kernel.org>,
 Kees Cook <keescook@chromium.org>, ecryptfs@vger.kernel.org,
 linux-nfs@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>,
 Tom Talpey <tom@talpey.com>, ocfs2-devel@lists.linux.dev,
 Yue Hu <huyue2@coolpad.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Eric Van Hensbergen <ericvh@kernel.org>, Amir Goldstein <amir73il@gmail.com>,
 Gao Xiang <xiang@kernel.org>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Jan Harkes <jaharkes@cs.cmu.edu>, Christian Brauner <brauner@kernel.org>,
 Sungjong Seo <sj1557.seo@samsung.com>, Theodore Ts'o <tytso@mit.edu>,
 Chris Mason <clm@fb.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 v9fs@lists.linux.dev, samba-technical@lists.samba.org,
 linux-unionfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>,
 Tejun Heo <tj@kernel.org>, Trond Myklebust <trond.myklebust@hammerspace.com>,
 Jeffle Xu <jefflexu@linux.alibaba.com>, Anna Schumaker <anna@kernel.org>,
 Jan Kara <jack@suse.com>, linux-fsdevel@vger.kernel.org,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Andrew Morton <akpm@linux-foundation.org>, ntfs3@lists.linux.dev,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org,
 Joel Becker <jlbec@evilplan.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 07 Aug 2023 15:38:31 -0400, Jeff Layton wrote:
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

[01/13] fs: remove silly warning from current_time
        https://git.kernel.org/vfs/vfs/c/562bcab11bf4
[02/13] fs: pass the request_mask to generic_fillattr
        https://git.kernel.org/vfs/vfs/c/3592165f4378
[03/13] fs: drop the timespec64 arg from generic_update_time
        https://git.kernel.org/vfs/vfs/c/32586bb50943
[04/13] btrfs: have it use inode_update_timestamps
        https://git.kernel.org/vfs/vfs/c/51fc38e7c7d1
[05/13] fat: make fat_update_time get its own timestamp
        https://git.kernel.org/vfs/vfs/c/d6e7faae82dc
[06/13] ubifs: have ubifs_update_time use inode_update_timestamps
        https://git.kernel.org/vfs/vfs/c/853ff59b434a
[07/13] xfs: have xfs_vn_update_time gets its own timestamp
        https://git.kernel.org/vfs/vfs/c/7ad056c2cf36
[08/13] fs: drop the timespec64 argument from update_time
        https://git.kernel.org/vfs/vfs/c/3beae086b71f
[09/13] fs: add infrastructure for multigrain timestamps
        https://git.kernel.org/vfs/vfs/c/b16956ed812f
[10/13] tmpfs: add support for multigrain timestamps
        https://git.kernel.org/vfs/vfs/c/bd21ec574f16
[11/13] xfs: switch to multigrain timestamps
        https://git.kernel.org/vfs/vfs/c/fb9812d2c39e
[12/13] ext4: switch to multigrain timestamps
        https://git.kernel.org/vfs/vfs/c/7fdf02299f5d
[13/13] btrfs: convert to multigrain timestamps
        https://git.kernel.org/vfs/vfs/c/2ebbf04988b9

