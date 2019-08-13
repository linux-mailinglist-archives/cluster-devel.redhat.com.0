Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 04BF28BBA8
	for <lists+cluster-devel@lfdr.de>; Tue, 13 Aug 2019 16:37:58 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9A5488E59B;
	Tue, 13 Aug 2019 14:37:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D9C210013A1;
	Tue, 13 Aug 2019 14:37:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2BF8C2551C;
	Tue, 13 Aug 2019 14:37:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7DEbbrG006778 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 13 Aug 2019 10:37:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 73D75100195C; Tue, 13 Aug 2019 14:37:37 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C51A10013A1
	for <cluster-devel@redhat.com>; Tue, 13 Aug 2019 14:37:35 +0000 (UTC)
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 50E89C049D62
	for <cluster-devel@redhat.com>; Tue, 13 Aug 2019 14:37:34 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id i2so49404946plt.1
	for <cluster-devel@redhat.com>; Tue, 13 Aug 2019 07:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=android.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=bw4HKPsz5KHcjk6HSfejuCsIw3GJFzkr29hAUy0bps0=;
	b=MFtq1gVoaeUSMonwadLhXhTtdodprj0ov0yRnwcJzaEizH9iXc2AyEe2YsLLjL9Em/
	DnRWUrLHNQkMs6a4pyzNtrfV9fh+f0WakaT7EGR/SddCESx4gNUJvdWbI0AnPn8pRpA3
	wgmNSZiOuSrw44CJp44y0pGPN0U6VzVYkB7JCci+tCmHHs3IKTEqfV+veY5UEDP6fcp7
	FcnOe1UR/JGhNA1vKqUgRY0O8lDkppt5VkhCp5z7ne3Sr1+pfITYHkHNFOIDKkVzXAz3
	95wisabfmhqSW6q/xPUyroW+UZ9ddmhvgoPCBG7x434/HPUw3rZO1bStEKXJRGENRSDr
	pjCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=bw4HKPsz5KHcjk6HSfejuCsIw3GJFzkr29hAUy0bps0=;
	b=j2TfRgnC9iTBOEAC/wbO7VV/Z+9mH5chVWnIJJuz/zOA05YUs96e8VM2icrrPMRMRk
	XDubYP9cNdEBAAW71BRUnB0z1k444j+uYsRNpUWQ88h5BJZWtyA2Cd903OvohwStewGy
	+vZuwukgf7ta/pQEolRWU00Rn0MFNGezQ10rvc1cdTKsBkP8qgNa4epKvqrY1Mljy6lG
	8fHKtiYISaRi/EzX04qCjNvRwpi60ePApha3h+sYzajygNO3PhC3m95j6k7x0//meBCC
	6gKKQ0BRJYA0sfw2gfTZEVPwP5i0mGy8uRqU7sliGFkjDXK3+doc6cQbY7ziFrPyeTtM
	JOkw==
X-Gm-Message-State: APjAAAV4fbgOQf2JikAHz16r86FbvonPdpYxN+SN+pI0GT72G3Sc124r
	Keve7X28VTc7xkMLUIvlorLiVvVFKR+pY5gL
X-Google-Smtp-Source: APXvYqyXJXgYI0HIs6xWxNQDIPLGgCxznsuGq+ryK3xceeQe7Za7UsLXSNSEqPCOTlNm5RgIykOuPA==
X-Received: by 2002:a17:902:aa03:: with SMTP id
	be3mr38125628plb.240.1565707053626; 
	Tue, 13 Aug 2019 07:37:33 -0700 (PDT)
Received: from nebulus.mtv.corp.google.com
	([2620:15c:211:200:5404:91ba:59dc:9400])
	by smtp.googlemail.com with ESMTPSA id
	v63sm114972475pfv.174.2019.08.13.07.37.30
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Aug 2019 07:37:32 -0700 (PDT)
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20190812193320.200472-1-salyzyn@android.com>
	<20190813084801.GA972@kroah.com>
From: Mark Salyzyn <salyzyn@android.com>
Message-ID: <e211bef2-f346-c9c7-f4b8-c774159b14e1@android.com>
Date: Tue, 13 Aug 2019 07:37:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190813084801.GA972@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 13 Aug 2019 14:37:34 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]);
	Tue, 13 Aug 2019 14:37:34 +0000 (UTC) for IP:'209.85.214.195'
	DOMAIN:'mail-pl1-f195.google.com'
	HELO:'mail-pl1-f195.google.com' FROM:'salyzyn@android.com' RCPT:''
X-RedHat-Spam-Score: -0.099  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
	SPF_PASS) 209.85.214.195 mail-pl1-f195.google.com 209.85.214.195
	mail-pl1-f195.google.com <salyzyn@android.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.31
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: Latchesar Ionkov <lucho@ionkov.net>, Dave Kleikamp <shaggy@kernel.org>,
	jfs-discussion@lists.sourceforge.net,
	Martin Brandenburg <martin@omnibond.com>, samba-technical@lists.samba.org,
	Dominique Martinet <asmadeus@codewreck.org>,
	Chao Yu <yuchao0@huawei.com>, Mimi Zohar <zohar@linux.ibm.com>,
	linux-unionfs@vger.kernel.org,
	David Howells <dhowells@redhat.com>, Chris Mason <clm@fb.com>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Eric Paris <eparis@parisplace.org>, netdev@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, linux-afs@lists.infradead.org,
	Mike Marshall <hubcap@omnibond.com>, linux-xfs@vger.kernel.org,
	Sage Weil <sage@redhat.com>, Miklos Szeredi <miklos@szeredi.hu>,
	Richard Weinberger <richard@nod.at>,
	Mark Fasheh <mark@fasheh.com>, Hugh Dickins <hughd@google.com>,
	James Morris <jmorris@namei.org>, cluster-devel@redhat.com,
	selinux@vger.kernel.org, linux-integrity@vger.kernel.org,
	Vyacheslav Dubeyko <slava@dubeyko.com>,
	Casey Schaufler <casey@schaufler-ca.com>,
	v9fs-developer@lists.sourceforge.net,
	Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
	kernel-team@android.com, linux-mm@kvack.org,
	devel@lists.orangefs.org, Serge Hallyn <serge@hallyn.com>,
	=?UTF-8?Q?Ernesto_A=2e_Fern=c3=a1ndez?=
	<ernesto.mnd.fernandez@gmail.com>, linux-cifs@vger.kernel.org,
	Eric Van Hensbergen <ericvh@gmail.com>, ecryptfs@vger.kernel.org,
	Josef Bacik <josef@toxicpanda.com>,
	reiserfs-devel@vger.kernel.org, Tejun Heo <tj@kernel.org>,
	linux-mtd@lists.infradead.org, David Sterba <dsterba@suse.com>,
	Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Paul Moore <paul@paul-moore.com>, linux-nfs@vger.kernel.org,
	Theodore Ts'o <tytso@mit.edu>, linux-fsdevel@vger.kernel.org,
	Joseph Qi <joseph.qi@linux.alibaba.com>,
	Mathieu Malaterre <malat@debian.org>, Stephen Smalley <sds@tycho.nsa.gov>,
	"Darrick J. Wong" <darrick.wong@oracle.com>,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Tyler Hicks <tyhicks@canonical.com>,
	Steve French <sfrench@samba.org>, linux-security-module@vger.kernel.org,
	ocfs2-devel@oss.oracle.com, Jan Kara <jack@suse.com>,
	Phillip Lougher <phillip@squashfs.org.uk>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Anna Schumaker <anna.schumaker@netapp.com>, linux-btrfs@vger.kernel.org,
	Alexander Viro <viro@zeniv.linux.org.uk>
Subject: Re: [Cluster-devel] [PATCH] Add flags option to get xattr method
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Tue, 13 Aug 2019 14:37:56 +0000 (UTC)

On 8/13/19 1:48 AM, Greg Kroah-Hartman wrote:
> On Mon, Aug 12, 2019 at 12:32:49PM -0700, Mark Salyzyn wrote:
>> --- a/include/linux/xattr.h
>> +++ b/include/linux/xattr.h
>> @@ -30,10 +30,10 @@ struct xattr_handler {
>>   	const char *prefix;
>>   	int flags;      /* fs private flags */
>>   	bool (*list)(struct dentry *dentry);
>> -	int (*get)(const struct xattr_handler *, struct dentry *dentry,
>> +	int (*get)(const struct xattr_handler *handler, struct dentry *dentry,
>>   		   struct inode *inode, const char *name, void *buffer,
>> -		   size_t size);
>> -	int (*set)(const struct xattr_handler *, struct dentry *dentry,
>> +		   size_t size, int flags);
>> +	int (*set)(const struct xattr_handler *handler, struct dentry *dentry,
>>   		   struct inode *inode, const char *name, const void *buffer,
>>   		   size_t size, int flags);
> Wow, 7 arguments.  Isn't there some nice rule of thumb that says once
> you get more then 5, a function becomes impossible to understand?

This is a method with a pot-pourri of somewhat intuitive useful, but not 
always necessary, arguments, the additional argument does not complicate 
the function(s) AFAIK, but maybe its usage. Most functions do not even 
reference handler, the inode is typically a derivative of dentry, The 
arguments most used are the name of the attribute and the buffer/size 
the results are to be placed into.

The addition of flags is actually a pattern borrowed from the [.]set 
method, which provides at least 32 bits of 'control' (of which we added 
only one). Before, it was an anti-pattern.

> Surely this could be a structure passed in here somehow, that way when
> you add the 8th argument in the future, you don't have to change
> everything yet again?  :)
Just be happy I provided int flags, instead of bool no_security ;-> 
there are a few bits there that can be used in the future.
> I don't have anything concrete to offer as a replacement fix for this,
> but to me this just feels really wrong...

I went through 6 different alternatives (in the overlayfs security fix 
patch set) until I found this one that resonated with the security and 
filesystem stakeholders. The one was a direct result of trying to reduce 
the security attack surface. This code was created by threading a 
needle, and evolution. I am game for a 7th alternative to solve the 
unionfs set of recursive calls into acquiring the extended attributes.

-- Mark

