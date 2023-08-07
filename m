Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B5725772F0B
	for <lists+cluster-devel@lfdr.de>; Mon,  7 Aug 2023 21:39:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691437145;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=AV25GXXjbfhny01pu5q6ETzgPzLaYRTHN2gggOnuQIc=;
	b=AvVCbokcJuhNP3s+TBesCTSlMFh5iTlINPjAsW2+i87SdzB5rZ56NnpH0iA3BuygSbPU8E
	Gw4GGSFk3LwgeUnGl2YvmmzRm9lrkaK8XxZ2VS7qKPbvYY3SuZGFkn9ok5YZ9X1k4G5vo1
	aEE/VsNQ8yzbURLR7wjPG889kL32ZQA=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-350-NXkKI2-NPLKsB5oNkUD4SQ-1; Mon, 07 Aug 2023 15:39:02 -0400
X-MC-Unique: NXkKI2-NPLKsB5oNkUD4SQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 933B1280FEC6;
	Mon,  7 Aug 2023 19:39:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3286B2026D4B;
	Mon,  7 Aug 2023 19:38:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8B6661946589;
	Mon,  7 Aug 2023 19:38:54 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 55B4D1946586 for <cluster-devel@listman.corp.redhat.com>;
 Mon,  7 Aug 2023 19:38:53 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D99A7403166; Mon,  7 Aug 2023 19:38:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D149A4021B9
 for <cluster-devel@redhat.com>; Mon,  7 Aug 2023 19:38:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B0D7B38117F9
 for <cluster-devel@redhat.com>; Mon,  7 Aug 2023 19:38:52 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-33-KsAhfI8IPWGJEhD-ryaLtg-1; Mon, 07 Aug 2023 15:38:49 -0400
X-MC-Unique: KsAhfI8IPWGJEhD-ryaLtg-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E8073621DD;
 Mon,  7 Aug 2023 19:38:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 054D5C433C7;
 Mon,  7 Aug 2023 19:38:38 +0000 (UTC)
From: Jeff Layton <jlayton@kernel.org>
Date: Mon, 07 Aug 2023 15:38:31 -0400
Message-Id: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADdI0WQC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyzHUUlJIzE
 vPSU3UzU4B8JSMDI2MDc0Nj3dz05JLM3FTdNKNEy7RkYyMTS0MLJaDqgqLUtMwKsEnRsbW1AGM
 0/ohZAAAA
To: Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, 
 Eric Van Hensbergen <ericvh@kernel.org>, 
 Latchesar Ionkov <lucho@ionkov.net>, 
 Dominique Martinet <asmadeus@codewreck.org>, 
 Christian Schoenebeck <linux_oss@crudebyte.com>, 
 David Howells <dhowells@redhat.com>, Marc Dionne <marc.dionne@auristor.com>, 
 Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, 
 David Sterba <dsterba@suse.com>, Xiubo Li <xiubli@redhat.com>, 
 Ilya Dryomov <idryomov@gmail.com>, Jan Harkes <jaharkes@cs.cmu.edu>, 
 coda@cs.cmu.edu, Tyler Hicks <code@tyhicks.com>, 
 Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>, 
 Yue Hu <huyue2@coolpad.com>, Jeffle Xu <jefflexu@linux.alibaba.com>, 
 Namjae Jeon <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>, 
 Jan Kara <jack@suse.com>, Theodore Ts'o <tytso@mit.edu>, 
 Andreas Dilger <adilger.kernel@dilger.ca>, Jaegeuk Kim <jaegeuk@kernel.org>, 
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, 
 Miklos Szeredi <miklos@szeredi.hu>, Bob Peterson <rpeterso@redhat.com>, 
 Andreas Gruenbacher <agruenba@redhat.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tejun Heo <tj@kernel.org>, 
 Trond Myklebust <trond.myklebust@hammerspace.com>, 
 Anna Schumaker <anna@kernel.org>, 
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
 Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, 
 Joseph Qi <joseph.qi@linux.alibaba.com>, 
 Mike Marshall <hubcap@omnibond.com>, 
 Martin Brandenburg <martin@omnibond.com>, 
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@chromium.org>, 
 Iurii Zaikin <yzaikin@google.com>, Steve French <sfrench@samba.org>, 
 Paulo Alcantara <pc@manguebit.com>, 
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, 
 Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Richard Weinberger <richard@nod.at>, Hans de Goede <hdegoede@redhat.com>, 
 Hugh Dickins <hughd@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
 Amir Goldstein <amir73il@gmail.com>, "Darrick J. Wong" <djwong@kernel.org>, 
 Benjamin Coddington <bcodding@redhat.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=5508; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=9NJxICXmYLBXPMfC64XdrCwzqAF8iKfLe8/dZ5HUTCM=;
 b=owEBbQKS/ZANAwAIAQAOaEEZVoIVAcsmYgBk0Ug9Vt6h3uVooR3L32BzC9FtHm9ZXcj5fgD9W
 kZjn/QE83GJAjMEAAEIAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCZNFIPQAKCRAADmhBGVaC
 FTXFD/4tOOz/frcT1juvFdX2M7h8GdVQCCM3jUzq8E7v2hZzdNQ+TudlDlEIxe9c16PcuMEkopG
 +kFNCV6iGCNYHD41A1XVOFEaG1ktWpd4NFo0iZbI38zUAkY1Hq+1jOeJ8bi322DrqAlwoonAz0S
 xjoCCsczgKHec9BxsuY4jfg7RVOvXrFnrpkUDxIomwZ80NN40sF+XG+bvbNSLZLb5dlTvoeQVQc
 smZ+JCtorGZdRxl2ILJbhENfex5Z0Cqgyh5A9MXqnl+J5Hm9s1es+lk7e+q9IK18+YypOP1HSHI
 K4MMDRodJG3ELlDifK8mUDMexXoWFTdW8MdVW5HTGHShQubI6zShgS4psxnRhF+jhlkcLxFz7Ui
 NL0E8WBVqsxLTUShLtKzEZ5j4wrb8yHur66NZrhvTeqgQwKIouSImzG0S+GAC8xIRAfXk06T/Do
 NpD+OXK/CELcMQD5+q1WcE7fPstPcyNp2PfOjHsnyMEzzkXXe3n1aeImG7MmCUDsftccGNQtajU
 WpL+Dq+bljKjojhVg9eJQYbnM0hNchEPUfMtAsdaFl7R/fRVlwsD+brmqMnYjtUGL/EPcQK+KrS
 4PhSQm9PfqdGsTZlG/r+wg2LxN9mxhg3X4wHeNUKI7S2IrJnkf5g6P8SBMSBluFrkbUD4n8Ko27
 OYH1/EhApgN3hYA==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: [Cluster-devel] [PATCH v7 00/13] fs: implement multigrain timestamps
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
Cc: Jan Kara <jack@suse.cz>, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-mtd@lists.infradead.org, linux-afs@lists.infradead.org,
 linux-cifs@vger.kernel.org, codalist@coda.cs.cmu.edu, cluster-devel@redhat.com,
 linux-ext4@vger.kernel.org, devel@lists.orangefs.org, ecryptfs@vger.kernel.org,
 ocfs2-devel@lists.linux.dev, ceph-devel@vger.kernel.org,
 linux-nfs@vger.kernel.org, v9fs@lists.linux.dev,
 samba-technical@lists.samba.org, linux-unionfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, ntfs3@lists.linux.dev,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The VFS always uses coarse-grained timestamps when updating the
ctime and mtime after a change. This has the benefit of allowing
filesystems to optimize away a lot metadata updates, down to around 1
per jiffy, even when a file is under heavy writes.

Unfortunately, this coarseness has always been an issue when we're
exporting via NFSv3, which relies on timestamps to validate caches. A
lot of changes can happen in a jiffy, so timestamps aren't sufficient to
help the client decide to invalidate the cache.

Even with NFSv4, a lot of exported filesystems don't properly support a
change attribute and are subject to the same problems with timestamp
granularity. Other applications have similar issues with timestamps (e.g
backup applications).

If we were to always use fine-grained timestamps, that would improve the
situation, but that becomes rather expensive, as the underlying
filesystem would have to log a lot more metadata updates.

What we need is a way to only use fine-grained timestamps when they are
being actively queried. The idea is to use an unused bit in the ctime's
tv_nsec field to mark when the mtime or ctime has been queried via
getattr. Once that has been marked, the next m/ctime update will use a
fine-grained timestamp.

Credit goes to Dave Chinner for the original idea, and to Ben Coddington
for the catchy name. This series should apply cleanly onto Christian's
vfs.ctime branch, once the v6 mgtime patches have been dropped. That
should be everything above this commit:

    525deaeb2fbf gfs2: fix timestamp handling on quota inodes

base-commit: cf22d118b89a09a0160586412160d89098f7c4c7
Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
Changes in v7:
- change update_time operation to fetch the current time itself
- don't modify current_time operation. Leave it always returning coarse timestamp
- rework inode_set_ctime_current for better atomicity and ensure that
  all mgtime filesystems use it
- reorder arguments to fill_mg_cmtime

Changes in v6:
- drop the patch that removed XFS_ICHGTIME_CHG
- change WARN_ON_ONCE to ASSERT in xfs conversion patch

---
Jeff Layton (13):
      fs: remove silly warning from current_time
      fs: pass the request_mask to generic_fillattr
      fs: drop the timespec64 arg from generic_update_time
      btrfs: have it use inode_update_timestamps
      fat: make fat_update_time get its own timestamp
      ubifs: have ubifs_update_time use inode_update_timestamps
      xfs: have xfs_vn_update_time gets its own timestamp
      fs: drop the timespec64 argument from update_time
      fs: add infrastructure for multigrain timestamps
      tmpfs: add support for multigrain timestamps
      xfs: switch to multigrain timestamps
      ext4: switch to multigrain timestamps
      btrfs: convert to multigrain timestamps

 fs/9p/vfs_inode.c               |   4 +-
 fs/9p/vfs_inode_dotl.c          |   4 +-
 fs/afs/inode.c                  |   2 +-
 fs/bad_inode.c                  |   3 +-
 fs/btrfs/file.c                 |  24 +----
 fs/btrfs/inode.c                |  14 +--
 fs/btrfs/super.c                |   5 +-
 fs/btrfs/volumes.c              |   4 +-
 fs/ceph/inode.c                 |   2 +-
 fs/coda/inode.c                 |   3 +-
 fs/ecryptfs/inode.c             |   5 +-
 fs/erofs/inode.c                |   2 +-
 fs/exfat/file.c                 |   2 +-
 fs/ext2/inode.c                 |   2 +-
 fs/ext4/inode.c                 |   2 +-
 fs/ext4/super.c                 |   2 +-
 fs/f2fs/file.c                  |   2 +-
 fs/fat/fat.h                    |   3 +-
 fs/fat/file.c                   |   2 +-
 fs/fat/misc.c                   |   6 +-
 fs/fuse/dir.c                   |   2 +-
 fs/gfs2/inode.c                 |   8 +-
 fs/hfsplus/inode.c              |   2 +-
 fs/inode.c                      | 200 +++++++++++++++++++++++++++++++---------
 fs/kernfs/inode.c               |   2 +-
 fs/libfs.c                      |   4 +-
 fs/minix/inode.c                |   2 +-
 fs/nfs/inode.c                  |   2 +-
 fs/nfs/namespace.c              |   3 +-
 fs/ntfs3/file.c                 |   2 +-
 fs/ocfs2/file.c                 |   2 +-
 fs/orangefs/inode.c             |   5 +-
 fs/overlayfs/inode.c            |   2 +-
 fs/overlayfs/overlayfs.h        |   2 +-
 fs/proc/base.c                  |   4 +-
 fs/proc/fd.c                    |   2 +-
 fs/proc/generic.c               |   2 +-
 fs/proc/proc_net.c              |   2 +-
 fs/proc/proc_sysctl.c           |   2 +-
 fs/proc/root.c                  |   3 +-
 fs/smb/client/inode.c           |   2 +-
 fs/smb/server/smb2pdu.c         |  22 ++---
 fs/smb/server/vfs.c             |   3 +-
 fs/stat.c                       |  65 ++++++++++---
 fs/sysv/itree.c                 |   3 +-
 fs/ubifs/dir.c                  |   2 +-
 fs/ubifs/file.c                 |  19 ++--
 fs/ubifs/ubifs.h                |   2 +-
 fs/udf/symlink.c                |   2 +-
 fs/vboxsf/utils.c               |   2 +-
 fs/xfs/libxfs/xfs_trans_inode.c |   6 +-
 fs/xfs/xfs_iops.c               |  25 +++--
 fs/xfs/xfs_super.c              |   2 +-
 include/linux/fs.h              |  55 +++++++++--
 mm/shmem.c                      |   4 +-
 55 files changed, 368 insertions(+), 192 deletions(-)
---
base-commit: 525deaeb2fbf634222f4231608c72190c551c935
change-id: 20230713-mgctime-f2a9fc324918

Best regards,
-- 
Jeff Layton <jlayton@kernel.org>

