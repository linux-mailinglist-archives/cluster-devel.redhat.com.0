Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 697137C963
	for <lists+cluster-devel@lfdr.de>; Wed, 31 Jul 2019 18:58:56 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A77CD3092666;
	Wed, 31 Jul 2019 16:58:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 870735D6B2;
	Wed, 31 Jul 2019 16:58:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 454391972D;
	Wed, 31 Jul 2019 16:58:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6VGwd3P027014 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 31 Jul 2019 12:58:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C7B09600C4; Wed, 31 Jul 2019 16:58:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C124F600F8
	for <cluster-devel@redhat.com>; Wed, 31 Jul 2019 16:58:36 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
	[209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A5E953082129
	for <cluster-devel@redhat.com>; Wed, 31 Jul 2019 16:58:17 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id r22so4730988pgk.10
	for <cluster-devel@redhat.com>; Wed, 31 Jul 2019 09:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=android.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ec+TCYltRZ+0BbWthj8J/cCYhvIm8sHJdK79dSthSdY=;
	b=jvJzTZBlmSeEYN+aZgAO0eQUN/Tk2RrbbnkPYld1oxWv6SRiwJlYMsrXwGgUEYUa4O
	c8IP9mSiBWfPnPUoMsfcP+avh6N+yXfmsFTOhlk/oLSPrOg61dplHWROkWXV2YCWs182
	J1E7UMPHDHumM9VHcwzfpneV57lGJ2pZrUb9g6VVDdWdrNFamw+D+bnFF2HIsMO1otBP
	QaYE36dCS32zu5Yfvc5rPyb7yUgw4D3O28kjNq/esNyy56+NllVY419E9QCcXJj+lNZ9
	n1nsl1oo8VqunmZKSa2BQZLlBHcA0KpEmN1VJDvIZg0i5KfyYr6715FMiAk9Bj8dpLw/
	L5lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ec+TCYltRZ+0BbWthj8J/cCYhvIm8sHJdK79dSthSdY=;
	b=HyEjp9bJlZtbW3Ur/dRhI5YQhhWDbF8I/ptiVhjHR3XwJ+tElEixOvQbIJiXBCSYgc
	kP/URfu6jtqNh6uIF3XJyZWYvfydM/TjkSFRV3IB+oGPy6BmdmFc3aMZB+cP7CfyMUjY
	fd5YdN/XpBsslPHuYoyG/GGokp96uCuVsIqrFEEL4Tz85S6F18mdC6avZifYC4S/IqPf
	QqMtoVxQ/XA+3kzcg5EGwLh1h3HaXgzz5LgIKnC4aCc53r6jO3SJjFW0hEqcg3zVOpmY
	GC+5evhIx39TQZWfzuHF2z1XMtWHRWZs4nxZEEgWPvmV3S2sVTMcLLjOAO2KZ4AboFKM
	m0Tw==
X-Gm-Message-State: APjAAAX4WHbsBqJ+Z5TSmSdUgsJxk4CZzxX9WO5F7/o3GxKhReAX7+z7
	N+HAwuy+XS8TLE5Ua28RmfA=
X-Google-Smtp-Source: APXvYqwAtm9Oi2dzrneje86zRIini04LNIAE0QYgVNa/tnC71lp2ENoOwAUjSIsPUfgwsF181KbaYg==
X-Received: by 2002:a62:6:: with SMTP id 6mr47453483pfa.159.1564592296986;
	Wed, 31 Jul 2019 09:58:16 -0700 (PDT)
Received: from nebulus.mtv.corp.google.com
	([2620:15c:211:200:5404:91ba:59dc:9400])
	by smtp.gmail.com with ESMTPSA id
	f72sm2245954pjg.10.2019.07.31.09.58.14
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 31 Jul 2019 09:58:16 -0700 (PDT)
From: Mark Salyzyn <salyzyn@android.com>
To: linux-kernel@vger.kernel.org
Date: Wed, 31 Jul 2019 09:57:56 -0700
Message-Id: <20190731165803.4755-2-salyzyn@android.com>
In-Reply-To: <20190731165803.4755-1-salyzyn@android.com>
References: <20190731165803.4755-1-salyzyn@android.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Wed, 31 Jul 2019 16:58:17 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]);
	Wed, 31 Jul 2019 16:58:17 +0000 (UTC) for IP:'209.85.215.174'
	DOMAIN:'mail-pg1-f174.google.com'
	HELO:'mail-pg1-f174.google.com' FROM:'salyzyn@android.com' RCPT:''
X-RedHat-Spam-Score: -0.101  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, SPF_HELO_NONE,
	SPF_PASS) 209.85.215.174 mail-pg1-f174.google.com 209.85.215.174
	mail-pg1-f174.google.com <salyzyn@android.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.42
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: Latchesar Ionkov <lucho@ionkov.net>, Dave Kleikamp <shaggy@kernel.org>,
	jfs-discussion@lists.sourceforge.net,
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
	Martin Brandenburg <martin@omnibond.com>, samba-technical@lists.samba.org,
	Dominique Martinet <asmadeus@codewreck.org>,
	Amir Goldstein <amir73il@gmail.com>,
	David Howells <dhowells@redhat.com>, Chris Mason <clm@fb.com>,
	"David S . Miller" <davem@davemloft.net>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	ocfs2-devel@oss.oracle.com, netdev@vger.kernel.org,
	Tyler Hicks <tyhicks@canonical.com>, linux-afs@lists.infradead.org,
	Mike Marshall <hubcap@omnibond.com>, linux-xfs@vger.kernel.org,
	Sage Weil <sage@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
	Richard Weinberger <richard@nod.at>,
	Mark Fasheh <mark@fasheh.com>, devel@lists.orangefs.org,
	Hugh Dickins <hughd@google.com>,
	linux-security-module@vger.kernel.org, cluster-devel@redhat.com,
	Vyacheslav Dubeyko <slava@dubeyko.com>,
	v9fs-developer@lists.sourceforge.net,
	Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
	Stephen Smalley <sds@tycho.nsa.gov>, linux-mm@kvack.org,
	Vivek Goyal <vgoyal@redhat.com>, Chao Yu <yuchao0@huawei.com>,
	linux-cifs@vger.kernel.org,
	Eric Van Hensbergen <ericvh@gmail.com>, ecryptfs@vger.kernel.org,
	Josef Bacik <josef@toxicpanda.com>,
	"Darrick J . Wong" <darrick.wong@oracle.com>,
	reiserfs-devel@vger.kernel.org, Tejun Heo <tj@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-mtd@lists.infradead.org, David Sterba <dsterba@suse.com>,
	Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	linux-nfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	Theodore Ts'o <tytso@mit.edu>, linux-fsdevel@vger.kernel.org,
	Joseph Qi <joseph.qi@linux.alibaba.com>,
	Mathieu Malaterre <malat@debian.org>, kernel-team@android.com,
	Miklos Szeredi <miklos@szeredi.hu>,
	Jeff Layton <jlayton@kernel.org>, linux-unionfs@vger.kernel.org,
	stable@vger.kernel.org, Mark Salyzyn <salyzyn@android.com>,
	Steve French <sfrench@samba.org>,
	=?UTF-8?q?Ernesto=20A=20=2E=20Fern=C3=A1ndez?=
	<ernesto.mnd.fernandez@gmail.com>,
	"Eric W . Biederman" <ebiederm@xmission.com>, Jan Kara <jack@suse.com>,
	Phillip Lougher <phillip@squashfs.org.uk>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Anna Schumaker <anna.schumaker@netapp.com>, linux-btrfs@vger.kernel.org,
	Alexander Viro <viro@zeniv.linux.org.uk>
Subject: [Cluster-devel] [PATCH v13 1/5] overlayfs: check
	CAP_DAC_READ_SEARCH before issuing exportfs_decode_fh
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Wed, 31 Jul 2019 16:58:55 +0000 (UTC)

Assumption never checked, should fail if the mounter creds are not
sufficient.

Signed-off-by: Mark Salyzyn <salyzyn@android.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Vivek Goyal <vgoyal@redhat.com>
Cc: Eric W. Biederman <ebiederm@xmission.com>
Cc: Amir Goldstein <amir73il@gmail.com>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Smalley <sds@tycho.nsa.gov>
Cc: linux-unionfs@vger.kernel.org
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: kernel-team@android.com
Cc: Eric Van Hensbergen <ericvh@gmail.com>
Cc: Latchesar Ionkov <lucho@ionkov.net>
Cc: Dominique Martinet <asmadeus@codewreck.org>
Cc: David Howells <dhowells@redhat.com>
Cc: Chris Mason <clm@fb.com>
Cc: Josef Bacik <josef@toxicpanda.com>
Cc: David Sterba <dsterba@suse.com>
Cc: Jeff Layton <jlayton@kernel.org>
Cc: Sage Weil <sage@redhat.com>
Cc: Ilya Dryomov <idryomov@gmail.com>
Cc: Steve French <sfrench@samba.org>
Cc: Tyler Hicks <tyhicks@canonical.com>
Cc: Jan Kara <jack@suse.com>
Cc: Theodore Ts'o <tytso@mit.edu>
Cc: Andreas Dilger <adilger.kernel@dilger.ca>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Chao Yu <yuchao0@huawei.com>
Cc: Bob Peterson <rpeterso@redhat.com>
Cc: Andreas Gruenbacher <agruenba@redhat.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Richard Weinberger <richard@nod.at>
Cc: Dave Kleikamp <shaggy@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Tejun Heo <tj@kernel.org>
Cc: Trond Myklebust <trond.myklebust@hammerspace.com>
Cc: Anna Schumaker <anna.schumaker@netapp.com>
Cc: Mark Fasheh <mark@fasheh.com>
Cc: Joel Becker <jlbec@evilplan.org>
Cc: Joseph Qi <joseph.qi@linux.alibaba.com>
Cc: Mike Marshall <hubcap@omnibond.com>
Cc: Martin Brandenburg <martin@omnibond.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Phillip Lougher <phillip@squashfs.org.uk>
Cc: Darrick J. Wong <darrick.wong@oracle.com>
Cc: linux-xfs@vger.kernel.org
Cc: Hugh Dickins <hughd@google.com>
Cc: David S. Miller <davem@davemloft.net>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Mathieu Malaterre <malat@debian.org>
Cc: Ernesto A. Fernández <ernesto.mnd.fernandez@gmail.com>
Cc: Vyacheslav Dubeyko <slava@dubeyko.com>
Cc: v9fs-developer@lists.sourceforge.net
Cc: linux-afs@lists.infradead.org
Cc: linux-btrfs@vger.kernel.org
Cc: ceph-devel@vger.kernel.org
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Cc: ecryptfs@vger.kernel.org
Cc: linux-ext4@vger.kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net
Cc: linux-fsdevel@vger.kernel.org
Cc: cluster-devel@redhat.com
Cc: linux-mtd@lists.infradead.org
Cc: jfs-discussion@lists.sourceforge.net
Cc: linux-nfs@vger.kernel.org
Cc: ocfs2-devel@oss.oracle.com
Cc: devel@lists.orangefs.org
Cc: reiserfs-devel@vger.kernel.org
Cc: linux-mm@kvack.org
Cc: netdev@vger.kernel.org
Cc: linux-security-module@vger.kernel.org
Cc: stable@vger.kernel.org # 4.4, 4.9, 4.14 & 4.19
---
v11 + v12 + v13 - rebase

v10:
- return NULL rather than ERR_PTR(-EPERM)
- did _not_ add it ovl_can_decode_fh() because of changes since last
  review, suspect needs to be added to ovl_lower_uuid_ok()?

v8 + v9:
- rebase

v7:
- This time for realz

v6:
- rebase

v5:
- dependency of "overlayfs: override_creds=off option bypass creator_cred"
---
 fs/overlayfs/namei.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/overlayfs/namei.c b/fs/overlayfs/namei.c
index e9717c2f7d45..9702f0d5309d 100644
--- a/fs/overlayfs/namei.c
+++ b/fs/overlayfs/namei.c
@@ -161,6 +161,9 @@ struct dentry *ovl_decode_real_fh(struct ovl_fh *fh, struct vfsmount *mnt,
 	if (!uuid_equal(&fh->uuid, &mnt->mnt_sb->s_uuid))
 		return NULL;
 
+	if (!capable(CAP_DAC_READ_SEARCH))
+		return NULL;
+
 	bytes = (fh->len - offsetof(struct ovl_fh, fid));
 	real = exportfs_decode_fh(mnt, (struct fid *)fh->fid,
 				  bytes >> 2, (int)fh->type,
-- 
2.22.0.770.g0f2c4a37fd-goog

