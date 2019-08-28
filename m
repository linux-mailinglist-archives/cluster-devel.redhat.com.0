Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E19A04C4
	for <lists+cluster-devel@lfdr.de>; Wed, 28 Aug 2019 16:25:11 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D0618C049D7C;
	Wed, 28 Aug 2019 14:25:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B8E755C1D6;
	Wed, 28 Aug 2019 14:25:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 99466180221D;
	Wed, 28 Aug 2019 14:25:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7SEP0ac005345 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 28 Aug 2019 10:25:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E1C54404D; Wed, 28 Aug 2019 14:25:00 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx26.extmail.prod.ext.phx2.redhat.com
	[10.5.110.67])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B902E196AE;
	Wed, 28 Aug 2019 14:24:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CFDD68980E7;
	Wed, 28 Aug 2019 14:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209;
	h=In-Reply-To:Content-Transfer-Encoding
	:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yJoo2pNqTHPzZm0pkWr+dI3Wt26Ba0eR+Mp1ZOx/yp8=;
	b=BK/KEpQDOLfLlooeYZXzciO0Ih
	KZ5wNCw5kNMwDJSk0pj1muklV9g/jk0KlTf/SwvC51pBQxSElrumaGBLZuHpQsR7SwxCq34Mot1XJ
	7gmWkyODNqXa17KKkWyyY+vNZDlZzp8AS0rGYTV0F62iEnMONHSEdfZ7H9Etcl0AcgK8bEkyOlbQS
	r0PBEi4ow8fP9ty81WDX7XQCZeJCQtgYLUTRfxVjcLjt8/fVN9n9I3tHAfoOBaAIjsYikU11xALWa
	mL+x3tHE/3UAq8EByi15+eJvdwQ/XwnR0l5pqHnWOA++zmSEHyLZkNeHHwA8OtgBc5w/ZqUGkIWTV
	GmBXUYFw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
	Linux)) id 1i2ys3-0005kr-PD; Wed, 28 Aug 2019 14:24:23 +0000
Date: Wed, 28 Aug 2019 07:24:23 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Mark Salyzyn <salyzyn@android.com>
Message-ID: <20190828142423.GA1955@infradead.org>
References: <20190827150544.151031-1-salyzyn@android.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190827150544.151031-1-salyzyn@android.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.67]); Wed, 28 Aug 2019 14:24:50 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.67]);
	Wed, 28 Aug 2019 14:24:50 +0000 (UTC) for IP:'198.137.202.133'
	DOMAIN:'bombadil.infradead.org' HELO:'bombadil.infradead.org'
	FROM:'BATV+49d2e20b56fbda768dd7+5848+infradead.org+hch@bombadil.srs.infradead.org'
	RCPT:''
X-RedHat-Spam-Score: -2.398  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_NONE) 198.137.202.133 bombadil.infradead.org 198.137.202.133
	bombadil.infradead.org
	<BATV+49d2e20b56fbda768dd7+5848+infradead.org+hch@bombadil.srs.infradead.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.67
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: Latchesar Ionkov <lucho@ionkov.net>, Hugh Dickins <hughd@google.com>,
	Mike Marshall <hubcap@omnibond.com>,
	James Morris <jmorris@namei.org>, devel@lists.orangefs.org,
	Eric Van Hensbergen <ericvh@gmail.com>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Mathieu Malaterre <malat@debian.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, Jan Kara <jack@suse.com>,
	Casey Schaufler <casey@schaufler-ca.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dave Kleikamp <shaggy@kernel.org>, linux-doc@vger.kernel.org,
	Jeff Layton <jlayton@kernel.org>, Chao Yu <yuchao0@huawei.com>,
	Mimi Zohar <zohar@linux.ibm.com>, linux-cifs@vger.kernel.org,
	Paul Moore <paul@paul-moore.com>,
	"Darrick J. Wong" <darrick.wong@oracle.com>,
	Eric Sandeen <sandeen@sandeen.net>, kernel-team@android.com,
	selinux@vger.kernel.org, Brian Foster <bfoster@redhat.com>,
	reiserfs-devel@vger.kernel.org, Tejun Heo <tj@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
	Miklos Szeredi <miklos@szeredi.hu>, linux-f2fs-devel@lists.sourceforge.net,
	linux-integrity@vger.kernel.org, Martin Brandenburg <martin@omnibond.com>,
	Chris Mason <clm@fb.com>, linux-mtd@lists.infradead.org,
	linux-afs@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>,
	Vyacheslav Dubeyko <slava@dubeyko.com>,
	Allison Henderson <allison.henderson@oracle.com>,
	Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
	Stephen Smalley <sds@tycho.nsa.gov>, Serge Hallyn <serge@hallyn.com>,
	Gao Xiang <gaoxiang25@huawei.com>,
	Eric Paris <eparis@parisplace.org>, ceph-devel@vger.kernel.org,
	linux-nfs@vger.kernel.org, linux-mm@kvack.org,
	samba-technical@lists.samba.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	"David S. Miller" <davem@davemloft.net>,
	ocfs2-devel@oss.oracle.com, jfs-discussion@lists.sourceforge.net,
	Jan Kara <jack@suse.cz>, Eric Biggers <ebiggers@google.com>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	David Howells <dhowells@redhat.com>,
	Joseph Qi <joseph.qi@linux.alibaba.com>,
	Andreas Dilger <adilger.kernel@dilger.ca>, devel@driverdev.osuosl.org,
	"J. Bruce Fields" <bfields@redhat.com>,
	Sage Weil <sage@redhat.com>, Richard Weinberger <richard@nod.at>,
	Mark Fasheh <mark@fasheh.com>, cluster-devel@redhat.com,
	Steve French <sfrench@samba.org>, v9fs-developer@lists.sourceforge.net,
	Bharath Vedartham <linux.bhar@gmail.com>,
	Jann Horn <jannh@google.com>, ecryptfs@vger.kernel.org,
	Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>,
	Artem Bityutskiy <dedekind1@gmail.com>, netdev@vger.kernel.org,
	linux-unionfs@vger.kernel.org, stable@vger.kernel.org,
	Tyler Hicks <tyhicks@canonical.com>, linux-security-module@vger.kernel.org,
	Phillip Lougher <phillip@squashfs.org.uk>,
	David Woodhouse <dwmw2@infradead.org>, linux-btrfs@vger.kernel.org,
	Alexander Viro <viro@zeniv.linux.org.uk>
Subject: Re: [Cluster-devel] [PATCH v8] Add flags option to get xattr method
 paired to __vfs_getxattr
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Wed, 28 Aug 2019 14:25:10 +0000 (UTC)

On Tue, Aug 27, 2019 at 08:05:15AM -0700, Mark Salyzyn wrote:
> Replace arguments for get and set xattr methods, and __vfs_getxattr
> and __vfs_setaxtr functions with a reference to the following now
> common argument structure:

Yikes.  That looks like a mess.  Why can't we pass a kernel-only
flag in the existing flags field for ₋>set and add a flags field
to ->get?  Passing methods by structure always tends to be a mess.

