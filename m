Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD51A052E
	for <lists+cluster-devel@lfdr.de>; Wed, 28 Aug 2019 16:40:31 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C175318B3D87;
	Wed, 28 Aug 2019 14:40:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5CEB25C3FD;
	Wed, 28 Aug 2019 14:40:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EB612180B536;
	Wed, 28 Aug 2019 14:40:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7SEeMFG005745 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 28 Aug 2019 10:40:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 81BA61001959; Wed, 28 Aug 2019 14:40:22 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7CA091001925
	for <cluster-devel@redhat.com>; Wed, 28 Aug 2019 14:40:19 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 44A38308402E
	for <cluster-devel@redhat.com>; Wed, 28 Aug 2019 14:40:19 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id y200so1865938pfb.6
	for <cluster-devel@redhat.com>; Wed, 28 Aug 2019 07:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=android.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=otBOnvzgcCfij7khznQb839FNBhUwDL3v2TXcjGpOzs=;
	b=OlcPfkFh4eVXaPXXhh3cHvgBURsJe3iAt4+TEVeWmIUa8zc09e0oQ5MaZNlepG2vze
	B3r7RgJuWq9O6TIbswaNUIKe8aYWW+KNRgEXeCMfCvmELHUyftJPl7HAVt/DUWoqH+mt
	7FiMUsP13ILyRxskXvgoEKTt4mcyDqpG+bZTW39pIt/5h+k8/JBgcB7qNM0XACYD7ale
	oWFmT2jC5R2Rv9fP9CO4NSXlbVjGTO4SWvbIfLdPsT4850CBsX7b6iyMaVYsWWgBm0EJ
	ydfkWGX0BboAbCSeR2RRikvC2V1c34KnlnNThn4oWcDh6RwGfO3sPku0/xiss22u0zC8
	qA2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=otBOnvzgcCfij7khznQb839FNBhUwDL3v2TXcjGpOzs=;
	b=bvvCGOC3/tVfU376bTPRK/DUz8eMM/vtAilkNzgh8TmlhS0kZqgtrDEBC8qL/UY4h9
	gqXEg+SbERo9tsLJB6PrbJyonLC8v4W4qOplw+Hv6qx8oI19ens/8/Raykzze+bLpFfo
	oHLjODJHO02on2PgcESiJebWa0s5c+37kuS8mjoayusQGkeCVnfeC6QCUKVPiKxTmtqJ
	DzRKskhhAqh9PTQazPyKtMuN55Xk1naS5SUfp15VmiollYkaEsENTdJV/VaLII79yRFf
	85Mz9hE0EtMwqKfaIy6a2ps4zkPUR3bMm0BJCdZYbrNqRh02oeCaoC/EVWr+VEx8CkNU
	+eug==
X-Gm-Message-State: APjAAAUNPJ0SGZmNyGu8pNzR9AQIxTL8Py8RxqsdcDSVAplXBPMmLU8y
	NCU3VJidFcGqLoFDV4imgBkXpw==
X-Google-Smtp-Source: APXvYqxMi0WkPdC/TIWQ/rEP0W+6WEwgY/rp8ZhYjwRr9PMekyUrfkMqryPcx5ziGSRNx/jQnRs5oA==
X-Received: by 2002:a17:90b:8ca:: with SMTP id
	ds10mr4474530pjb.139.1567003218534; 
	Wed, 28 Aug 2019 07:40:18 -0700 (PDT)
Received: from nebulus.mtv.corp.google.com
	([2620:15c:211:200:5404:91ba:59dc:9400])
	by smtp.googlemail.com with ESMTPSA id
	t9sm7295641pgj.89.2019.08.28.07.40.15
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 28 Aug 2019 07:40:17 -0700 (PDT)
To: Christoph Hellwig <hch@infradead.org>
References: <20190827150544.151031-1-salyzyn@android.com>
	<20190828142423.GA1955@infradead.org>
From: Mark Salyzyn <salyzyn@android.com>
Message-ID: <5dd09a38-fffb-36f2-505b-be2ddf6bb750@android.com>
Date: Wed, 28 Aug 2019 07:40:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190828142423.GA1955@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Wed, 28 Aug 2019 14:40:19 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]);
	Wed, 28 Aug 2019 14:40:19 +0000 (UTC) for IP:'209.85.210.195'
	DOMAIN:'mail-pf1-f195.google.com'
	HELO:'mail-pf1-f195.google.com' FROM:'salyzyn@android.com' RCPT:''
X-RedHat-Spam-Score: -0.099  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
	SPF_PASS) 209.85.210.195 mail-pf1-f195.google.com 209.85.210.195
	mail-pf1-f195.google.com <salyzyn@android.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.40
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.63]); Wed, 28 Aug 2019 14:40:29 +0000 (UTC)

On 8/28/19 7:24 AM, Christoph Hellwig wrote:
> On Tue, Aug 27, 2019 at 08:05:15AM -0700, Mark Salyzyn wrote:
>> Replace arguments for get and set xattr methods, and __vfs_getxattr
>> and __vfs_setaxtr functions with a reference to the following now
>> common argument structure:
> Yikes.  That looks like a mess.  Why can't we pass a kernel-only
> flag in the existing flags field for ₋>set and add a flags field
> to ->get?  Passing methods by structure always tends to be a mess.

This was a response to GregKH@ criticism, an earlier patch set just 
added a flag as you stated to get method, until complaints of an 
excessively long argument list and fragility to add or change more 
arguments.

So many ways have been tried to skin this cat ... the risk was taken to 
please some, and we now have hundreds of stakeholders, when the first 
patch set was less than a dozen. A recipe for failure?

-- Mark

