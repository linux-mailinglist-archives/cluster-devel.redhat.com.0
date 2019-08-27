Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 467DB9EB9F
	for <lists+cluster-devel@lfdr.de>; Tue, 27 Aug 2019 16:55:05 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 75E751027011;
	Tue, 27 Aug 2019 14:55:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 27BEE196AE;
	Tue, 27 Aug 2019 14:55:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DBEF32551B;
	Tue, 27 Aug 2019 14:54:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7REsp3S026147 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 27 Aug 2019 10:54:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E8A935C22F; Tue, 27 Aug 2019 14:54:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E2C175C220
	for <cluster-devel@redhat.com>; Tue, 27 Aug 2019 14:54:49 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D5F9A811DC
	for <cluster-devel@redhat.com>; Tue, 27 Aug 2019 14:54:48 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id o70so14284439pfg.5
	for <cluster-devel@redhat.com>; Tue, 27 Aug 2019 07:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=android.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=J0PyrXbgy2rQbHf32v3WQfO8h7H5WwZ0x8ImHOimCWs=;
	b=mzwUwotHCHLyC8kvJQKX2qfkclXUibOZVKlCSAmub430gCcW4lmMANVBjk4ZJn37Mz
	lmwqaekfvRnk91fWBTPe9MdR6DNIOZYbn1kKQlCtB2EIRUw9eVK89gLHZxbOnS+BoN9O
	z/e+lec1c3V+A/cevmzn6YhUNeV1qLcxR5P5ZMIEm0QeC99vQIqrptkzAecOAow3P+WG
	qTbXtfhvLGsZsqUEkNrN67J91EYh7XB3OB1b7OQP26/5Ffe7WcOAgQyPgjx4Kr7W8Oc+
	UwQjFeNzqy6bSLsp44PwvDCnhYQ/gCS2wppnuYUD4QcGMN8OxcAFpKCWSwZ+EWDarzDN
	vqDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=J0PyrXbgy2rQbHf32v3WQfO8h7H5WwZ0x8ImHOimCWs=;
	b=Wnl298ZCNBcqjBXBjkKGE2dJW/4QO6AX8cyL0CrJzUm0Y+t+0d4cf9g7Ntz8VLFTVW
	eXDUgTH07G++xN2+NoMcIDRRqDiwMMf+GBFRVatV4yIM0fI9/K0+ceYiGwIJyYwH+Rts
	V1oed8Ak4YE6QCllYE4aOm/8qlWITH0XlGySmK3Gjs82fyCGY/KKGusTAUoT+c7ZILZA
	gAEWxR1nNnQirDC4zrX//RGMUPT/djLXexJESuQlVa7npmpZb3C9DNCvJFQ+Btxk8Rty
	bnM1yAOgZCUZCBv2K8NCVkW3Sp17Q2Oj0PMa1jNUg4W3WF2DEvhoEH4MdnPapRdlfdY6
	f5/Q==
X-Gm-Message-State: APjAAAVY6JlUrEPYfoUAfx1SWh7h+ZdhD9TGc5BkrYISm2A9I8LlcPKB
	Dgjsl5u6U+beGpcO+0CRxEWO/Q==
X-Google-Smtp-Source: APXvYqwBoH7/mHEw1qHJ4C0pvUdOnWf9w3cFM7T1JRRoXNt8gEzBDpTDPLau8WREch+lyRDJT+u4BA==
X-Received: by 2002:a65:6891:: with SMTP id e17mr20940506pgt.305.1566917687986;
	Tue, 27 Aug 2019 07:54:47 -0700 (PDT)
Received: from nebulus.mtv.corp.google.com
	([2620:15c:211:200:5404:91ba:59dc:9400])
	by smtp.googlemail.com with ESMTPSA id
	s125sm30946505pfc.133.2019.08.27.07.54.45
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 27 Aug 2019 07:54:47 -0700 (PDT)
To: Jan Kara <jack@suse.cz>
References: <20190820180716.129882-1-salyzyn@android.com>
	<20190827141952.GB10098@quack2.suse.cz>
From: Mark Salyzyn <salyzyn@android.com>
Message-ID: <8468b22d-05b7-47d3-eb93-2c71dafea3ee@android.com>
Date: Tue, 27 Aug 2019 07:54:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190827141952.GB10098@quack2.suse.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 27 Aug 2019 14:54:48 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]);
	Tue, 27 Aug 2019 14:54:48 +0000 (UTC) for IP:'209.85.210.195'
	DOMAIN:'mail-pf1-f195.google.com'
	HELO:'mail-pf1-f195.google.com' FROM:'salyzyn@android.com' RCPT:''
X-RedHat-Spam-Score: -0.099  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
	SPF_PASS) 209.85.210.195 mail-pf1-f195.google.com 209.85.210.195
	mail-pf1-f195.google.com <salyzyn@android.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.27
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: Latchesar Ionkov <lucho@ionkov.net>, Eric Sandeen <sandeen@sandeen.net>,
	Mike Marshall <hubcap@omnibond.com>, linux-xfs@vger.kernel.org,
	James Morris <jmorris@namei.org>, devel@lists.orangefs.org,
	Eric Van Hensbergen <ericvh@gmail.com>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Mathieu Malaterre <malat@debian.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, Jan Kara <jack@suse.com>,
	Casey Schaufler <casey@schaufler-ca.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dave Kleikamp <shaggy@kernel.org>, linux-doc@vger.kernel.org,
	Jeff Layton <jlayton@kernel.org>, Chao Yu <yuchao0@huawei.com>,
	Mimi Zohar <zohar@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>,
	linux-cifs@vger.kernel.org, Paul Moore <paul@paul-moore.com>,
	"Darrick J. Wong" <darrick.wong@oracle.com>,
	Hugh Dickins <hughd@google.com>, kernel-team@android.com,
	selinux@vger.kernel.org, Brian Foster <bfoster@redhat.com>,
	reiserfs-devel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
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
	linux-nfs@vger.kernel.org, Joseph Qi <joseph.qi@linux.alibaba.com>,
	samba-technical@lists.samba.org,
	Steve French <sfrench@samba.org>, Tejun Heo <tj@kernel.org>,
	linux-erofs@lists.ozlabs.org, Anna Schumaker <anna.schumaker@netapp.com>,
	ocfs2-devel@oss.oracle.com, jfs-discussion@lists.sourceforge.net,
	Eric Biggers <ebiggers@google.com>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Jeff Mahoney <jeffm@suse.com>, linux-unionfs@vger.kernel.org,
	David Howells <dhowells@redhat.com>, linux-mm@kvack.org,
	Andreas Dilger <adilger.kernel@dilger.ca>, devel@driverdev.osuosl.org,
	"J. Bruce Fields" <bfields@redhat.com>,
	Sage Weil <sage@redhat.com>, Richard Weinberger <richard@nod.at>,
	Mark Fasheh <mark@fasheh.com>,
	linux-security-module@vger.kernel.org, cluster-devel@redhat.com,
	v9fs-developer@lists.sourceforge.net,
	Bharath Vedartham <linux.bhar@gmail.com>,
	Jann Horn <jannh@google.com>, ecryptfs@vger.kernel.org,
	Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>,
	Artem Bityutskiy <dedekind1@gmail.com>, netdev@vger.kernel.org,
	Adrian Hunter <adrian.hunter@intel.com>, stable@vger.kernel.org,
	Tyler Hicks <tyhicks@canonical.com>,
	=?UTF-8?Q?Ernesto_A=2e_Fern=c3=a1ndez?= <ernesto.mnd.fernandez@gmail.com>,
	Phillip Lougher <phillip@squashfs.org.uk>,
	David Woodhouse <dwmw2@infradead.org>, linux-btrfs@vger.kernel.org,
	Alexander Viro <viro@zeniv.linux.org.uk>
Subject: Re: [Cluster-devel] [PATCH v7] Add flags option to get xattr method
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.66]); Tue, 27 Aug 2019 14:55:04 +0000 (UTC)

On 8/27/19 7:19 AM, Jan Kara wrote:
> On Tue 20-08-19 11:06:48, Mark Salyzyn wrote:
>> diff --git a/Documentation/filesystems/Locking b/Documentation/filesystems/Locking
>> index 204dd3ea36bb..e2687f21c7d6 100644
>> --- a/Documentation/filesystems/Locking
>> +++ b/Documentation/filesystems/Locking
>> @@ -101,12 +101,10 @@ of the locking scheme for directory operations.
>>   ----------------------- xattr_handler operations -----------------------
>>   prototypes:
>>   	bool (*list)(struct dentry *dentry);
>> -	int (*get)(const struct xattr_handler *handler, struct dentry *dentry,
>> -		   struct inode *inode, const char *name, void *buffer,
>> -		   size_t size);
>> -	int (*set)(const struct xattr_handler *handler, struct dentry *dentry,
>> -		   struct inode *inode, const char *name, const void *buffer,
>> -		   size_t size, int flags);
>> +	int (*get)(const struct xattr_handler *handler,
>> +		   struct xattr_gs_flags);
>> +	int (*set)(const struct xattr_handler *handler,
>> +		   struct xattr_gs_flags);
> The prototype here is really "struct xattr_gs_flags *args", isn't it?
> Otherwise feel free to add:
>
> Reviewed-by: Jan Kara <jack@suse.cz>
>
> for the ext2, ext4, ocfs2, reiserfs, and the generic fs/* bits.
>
> 								Honza

<oops> Thanks and good catch, will respin with a fix to the 
documentation shortly.

-- Mark

