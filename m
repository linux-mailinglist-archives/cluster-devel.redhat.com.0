Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id CE011A2C3E
	for <lists+cluster-devel@lfdr.de>; Fri, 30 Aug 2019 03:25:13 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E8CF1308218D;
	Fri, 30 Aug 2019 01:25:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2488A5C1D6;
	Fri, 30 Aug 2019 01:25:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 048FC1800B74;
	Fri, 30 Aug 2019 01:25:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7U1OttZ031885 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 29 Aug 2019 21:24:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 03C3C5D9E2; Fri, 30 Aug 2019 01:24:55 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx29.extmail.prod.ext.phx2.redhat.com
	[10.5.110.70])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F31705D9D3
	for <cluster-devel@redhat.com>; Fri, 30 Aug 2019 01:24:52 +0000 (UTC)
Received: from mail-yw1-f68.google.com (mail-yw1-f68.google.com
	[209.85.161.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BC495190C02E
	for <cluster-devel@redhat.com>; Fri, 30 Aug 2019 01:24:50 +0000 (UTC)
Received: by mail-yw1-f68.google.com with SMTP id i207so1832466ywc.9
	for <cluster-devel@redhat.com>; Thu, 29 Aug 2019 18:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=omnibond-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=4TfZVE6zvYYuoOuB/Rxqa+Mlm3vtxZPY12krCFPSTtI=;
	b=rsF3TnYvnJjkhMrqd8jgi2b1fWfnS720m/snkWNYBAl3jogwp2mEsqA8h0meBBMFCG
	mupgLKrOXopsTT3mx+lDcAZLHUPbfCw/vXrZaEIvlfIiq4H0dj/IKCul0NWP4fpGLsu4
	48Lini1zfDu9D/EL0CeWiI8kZAXrgg08x+hcJWXhpsmSN701z4+zSsQ5V2A/N+PZ/ko+
	cAveXQxi5GTfOnxm/M0L2QMcpa0QpEp0UoezlsX6vklrx1noOLsykTvVpPGdg1yASetm
	NGCTD4uF7gFM2G4DP0Fj0jWpPyOxMpJF0KkXFU1tGtaTorkpzYDBwzJA49OyfPjy95xt
	U/rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=4TfZVE6zvYYuoOuB/Rxqa+Mlm3vtxZPY12krCFPSTtI=;
	b=g4P4rD2bj4ejINoa9MAJLYapv5+gzn0IdC2D72Ikp6cHfmBoXovnvMs056isZGKQ6m
	dnuvasa8tnoGiGhAFUVxDWaAcpMhjZIy8vMGn9Adz4jV4dPFtQtEupg2KlGNYlDPXJpW
	X0LhAsRac1Btj7lMWrzHzR2mSY6bD0dQnJ1xRH3vA38vXl85op6s9x54gMp9vvbsGuY7
	TZBNagIVyvnZh4Nzwa1xD+LoGAMYFoXUBquQuk3H9bqQfEj142fmmrYlDuwYJL9RcKpi
	NPA5R8qSuI0Jn2TwAycDFujLJ8lovx7tIBGW0IPzD97/hm6LFDRDl91dcolU4CjiysPB
	gs0A==
X-Gm-Message-State: APjAAAUcwJob7LkhMkiBgsDUT0AcFPiO2UgXcu6bEaQJxQ8WvF4fTkoJ
	ABaoNfI6bPuOh4+N/H1aFlCdGD5GS/K11A0LhV+nPA==
X-Google-Smtp-Source: APXvYqwS/gBw6GYqWJhwCNBmHR6+W2ONQRTVjMY8ZXLyRIgVZbf1blJaiiDec2a/U/ArNO35ME5xZuocZ9cXu0GpPKQ=
X-Received: by 2002:a0d:d596:: with SMTP id x144mr9018446ywd.69.1567128290041; 
	Thu, 29 Aug 2019 18:24:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190827150544.151031-1-salyzyn@android.com>
	<20190828142423.GA1955@infradead.org>
	<5dd09a38-fffb-36f2-505b-be2ddf6bb750@android.com>
In-Reply-To: <5dd09a38-fffb-36f2-505b-be2ddf6bb750@android.com>
From: Mike Marshall <hubcap@omnibond.com>
Date: Thu, 29 Aug 2019 21:24:38 -0400
Message-ID: <CAOg9mSTCC4Z3RpEyppC50B+pnSBbV0sr-F7hbsM-B+z3c-AZVA@mail.gmail.com>
To: Mark Salyzyn <salyzyn@android.com>
Content-Type: text/plain; charset="UTF-8"
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.70]);
	Fri, 30 Aug 2019 01:24:50 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.70]);
	Fri, 30 Aug 2019 01:24:50 +0000 (UTC) for IP:'209.85.161.68'
	DOMAIN:'mail-yw1-f68.google.com' HELO:'mail-yw1-f68.google.com'
	FROM:'hubcap@omnibond.com' RCPT:''
X-RedHat-Spam-Score: 0.004  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
	SPF_NONE) 209.85.161.68 mail-yw1-f68.google.com 209.85.161.68
	mail-yw1-f68.google.com <hubcap@omnibond.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.70
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Content-Transfer-Encoding: 8bit
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x7U1OttZ031885
X-loop: cluster-devel@redhat.com
Cc: Latchesar Ionkov <lucho@ionkov.net>, Hugh Dickins <hughd@google.com>,
	James Morris <jmorris@namei.org>, devel@lists.orangefs.org,
	Eric Van Hensbergen <ericvh@gmail.com>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Mathieu Malaterre <malat@debian.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	LKML <linux-kernel@vger.kernel.org>, Jan Kara <jack@suse.com>,
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
	Miklos Szeredi <miklos@szeredi.hu>, "Linux F2FS DEV,
	Mailing List" <linux-f2fs-devel@lists.sourceforge.net>,
	linux-integrity@vger.kernel.org, Martin Brandenburg <martin@omnibond.com>,
	Chris Mason <clm@fb.com>, linux-mtd <linux-mtd@lists.infradead.org>,
	linux-afs@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>,
	Vyacheslav Dubeyko <slava@dubeyko.com>,
	Allison Henderson <allison.henderson@oracle.com>,
	Ilya Dryomov <idryomov@gmail.com>,
	Ext4 Developers List <linux-ext4@vger.kernel.org>,
	Stephen Smalley <sds@tycho.nsa.gov>, Serge Hallyn <serge@hallyn.com>,
	Gao Xiang <gaoxiang25@huawei.com>, Eric Paris <eparis@parisplace.org>,
	ceph-devel <ceph-devel@vger.kernel.org>,
	Linux NFS Mailing List <linux-nfs@vger.kernel.org>,
	linux-mm <linux-mm@kvack.org>, samba-technical@lists.samba.org,
	linux-xfs@vger.kernel.org, linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	linux-erofs@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
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
	Steve French <sfrench@samba.org>,
	V9FS Developers <v9fs-developer@lists.sourceforge.net>,
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Fri, 30 Aug 2019 01:25:12 +0000 (UTC)

I added this patch series on top of Linux 5.3-rc6 and ran xfstests
on orangefs with no regressions.

Acked-by: Mike Marshall <hubcap@omnibond.com>

-Mike

On Wed, Aug 28, 2019 at 10:40 AM Mark Salyzyn <salyzyn@android.com> wrote:
>
> On 8/28/19 7:24 AM, Christoph Hellwig wrote:
> > On Tue, Aug 27, 2019 at 08:05:15AM -0700, Mark Salyzyn wrote:
> >> Replace arguments for get and set xattr methods, and __vfs_getxattr
> >> and __vfs_setaxtr functions with a reference to the following now
> >> common argument structure:
> > Yikes.  That looks like a mess.  Why can't we pass a kernel-only
> > flag in the existing flags field for ₋>set and add a flags field
> > to ->get?  Passing methods by structure always tends to be a mess.
>
> This was a response to GregKH@ criticism, an earlier patch set just
> added a flag as you stated to get method, until complaints of an
> excessively long argument list and fragility to add or change more
> arguments.
>
> So many ways have been tried to skin this cat ... the risk was taken to
> please some, and we now have hundreds of stakeholders, when the first
> patch set was less than a dozen. A recipe for failure?
>
> -- Mark
>

