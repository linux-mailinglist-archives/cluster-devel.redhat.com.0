Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2D48D6B0
	for <lists+cluster-devel@lfdr.de>; Wed, 14 Aug 2019 16:55:28 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7DB14C05AA64;
	Wed, 14 Aug 2019 14:55:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DC12E19C7F;
	Wed, 14 Aug 2019 14:55:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E30E51C93;
	Wed, 14 Aug 2019 14:55:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7EEsNTg023500 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 14 Aug 2019 10:54:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A431239CA; Wed, 14 Aug 2019 14:54:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9EBCB8328B
	for <cluster-devel@redhat.com>; Wed, 14 Aug 2019 14:54:21 +0000 (UTC)
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 31447300BEA9
	for <cluster-devel@redhat.com>; Wed, 14 Aug 2019 14:54:20 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id c2so50791325plz.13
	for <cluster-devel@redhat.com>; Wed, 14 Aug 2019 07:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=android.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=CnI+bcK+PrkZXa0lXxFneGD0jULXut8K+Ere8plo5Kc=;
	b=ahMJ7+6MRm+vSMGaNapJnzEVkJAGqdseEv5NiAiJ2xVM1sgCa/KjV3CzptwbORiRO4
	tdVwxwGBtUsGnUn2c7e13VySsAmWdVDIrtQOwhPmb7DJeeLmPii1ZL4rskNBRvtj47Hs
	RPxCzpXwnaU3g/CUfEBg3QlPGY1SngnQDCYWpuzQB5cndu90bUkPUFPxqy0/Rekd1WQO
	4zngI17UYs23Aiqj3B79lt987Hor3fkgPNT95mLnJes5xZMFhtrjHD+wvpp9CvYS0OOT
	T0Jx+829oyOwsEqr2Xgl3CEpOuwA5/x9WXxEUC4UDChgzDD/d77A140pfqc0MLV3w5Tr
	/pug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=CnI+bcK+PrkZXa0lXxFneGD0jULXut8K+Ere8plo5Kc=;
	b=JHNVnhXGECvpV2r85cKVuOmJ96nws5J7kZzA5GRZLvOWwS9A30H9x/oCXAIIl3xTyJ
	wk0AC8EMtEeFbHc/wLF/jgMjwwMnpkN1x1r7SpG5QriY2YEEzP/yao408+O81tlcsYqF
	ie3IL4A3OtRaz/yzTcHBJynylv8sL1bE9UdkuR9FTm8itHDb0nFnSIXzjv/iR0MrvaLT
	GW9Kr8NMpCBCpFq5u22d65HHsG2cBN2leOpKl8N9JXQE7pntvXjfHCacCcDiORXjdd87
	IZsQzIHvJ5aYra+YbWr99kDRZh6vh/oVjiOUdfaAMFjHB6X4DaPZ7082GAH6Lh1gn+ML
	TmHQ==
X-Gm-Message-State: APjAAAX0MC33vBtvEUNtawcJGhJNslOL9psXQ774zS2KEjAvHtt/wiOJ
	sYILHTnViJGC8Kl9xU8DAd7jBQ==
X-Google-Smtp-Source: APXvYqz3CwepJ0lR8OwKX1IycWhHHs06AM+yzu0iFct+XZq8bOtgfYosWIvv1z0G9d0AAh0UWfDALQ==
X-Received: by 2002:a17:902:3103:: with SMTP id
	w3mr43683432plb.84.1565794459417; 
	Wed, 14 Aug 2019 07:54:19 -0700 (PDT)
Received: from nebulus.mtv.corp.google.com
	([2620:15c:211:200:5404:91ba:59dc:9400])
	by smtp.googlemail.com with ESMTPSA id
	f20sm144508955pgg.56.2019.08.14.07.54.16
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 14 Aug 2019 07:54:18 -0700 (PDT)
To: Jan Kara <jack@suse.cz>
References: <20190813145527.26289-1-salyzyn@android.com>
	<20190814110022.GB26273@quack2.suse.cz>
From: Mark Salyzyn <salyzyn@android.com>
Message-ID: <71d66fd1-cc94-fd0c-dfa7-115ba8a6b95a@android.com>
Date: Wed, 14 Aug 2019 07:54:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190814110022.GB26273@quack2.suse.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Wed, 14 Aug 2019 14:54:20 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]);
	Wed, 14 Aug 2019 14:54:20 +0000 (UTC) for IP:'209.85.214.195'
	DOMAIN:'mail-pl1-f195.google.com'
	HELO:'mail-pl1-f195.google.com' FROM:'salyzyn@android.com' RCPT:''
X-RedHat-Spam-Score: -0.099  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
	SPF_PASS) 209.85.214.195 mail-pl1-f195.google.com 209.85.214.195
	mail-pl1-f195.google.com <salyzyn@android.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.42
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: Latchesar Ionkov <lucho@ionkov.net>, Dave Kleikamp <shaggy@kernel.org>,
	jfs-discussion@lists.sourceforge.net,
	Phillip Lougher <phillip@squashfs.org.uk>, linux-xfs@vger.kernel.org,
	Martin Brandenburg <martin@omnibond.com>, samba-technical@lists.samba.org,
	Dominique Martinet <asmadeus@codewreck.org>,
	Chao Yu <yuchao0@huawei.com>, Mimi Zohar <zohar@linux.ibm.com>,
	Adrian Hunter <adrian.hunter@intel.com>, linux-mm@kvack.org,
	Chris Mason <clm@fb.com>, netdev@vger.kernel.org,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Eric Paris <eparis@parisplace.org>, linux-f2fs-devel@lists.sourceforge.net,
	linux-afs@lists.infradead.org, Stephen Smalley <sds@tycho.nsa.gov>,
	Mike Marshall <hubcap@omnibond.com>, devel@driverdev.osuosl.org,
	linux-cifs@vger.kernel.org, Paul Moore <paul@paul-moore.com>,
	Sage Weil <sage@redhat.com>, "Darrick J. Wong" <darrick.wong@oracle.com>,
	Richard Weinberger <richard@nod.at>,
	Mark Fasheh <mark@fasheh.com>, linux-unionfs@vger.kernel.org,
	Hugh Dickins <hughd@google.com>,
	James Morris <jmorris@namei.org>, cluster-devel@redhat.com,
	Joseph Qi <joseph.qi@linux.alibaba.com>, linux-integrity@vger.kernel.org,
	Vyacheslav Dubeyko <slava@dubeyko.com>,
	Casey Schaufler <casey@schaufler-ca.com>,
	v9fs-developer@lists.sourceforge.net,
	Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
	kernel-team@android.com, devel@lists.orangefs.org,
	Serge Hallyn <serge@hallyn.com>, Gao Xiang <gaoxiang25@huawei.com>,
	Eric Van Hensbergen <ericvh@gmail.com>, ecryptfs@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, Josef Bacik <josef@toxicpanda.com>,
	reiserfs-devel@vger.kernel.org, Anna Schumaker <anna.schumaker@netapp.com>,
	David Sterba <dsterba@suse.com>,
	Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
	selinux@vger.kernel.org, Trond Myklebust <trond.myklebust@hammerspace.com>,
	David Howells <dhowells@redhat.com>, linux-nfs@vger.kernel.org,
	Theodore Ts'o <tytso@mit.edu>, linux-fsdevel@vger.kernel.org,
	Artem Bityutskiy <dedekind1@gmail.com>,
	Mathieu Malaterre <malat@debian.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Tyler Hicks <tyhicks@canonical.com>,
	Steve French <sfrench@samba.org>, =?UTF-8?Q?Ernesto_A=2e_Fern=c3=a1ndez?=
	<ernesto.mnd.fernandez@gmail.com>, linux-btrfs@vger.kernel.org,
	linux-security-module@vger.kernel.org, Jan Kara <jack@suse.com>,
	Tejun Heo <tj@kernel.org>, linux-mtd@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>,
	David Woodhouse <dwmw2@infradead.org>,
	"David S. Miller" <davem@davemloft.net>, ocfs2-devel@oss.oracle.com,
	Alexander Viro <viro@zeniv.linux.org.uk>
Subject: Re: [Cluster-devel] [PATCH v2] Add flags option to get xattr method
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Wed, 14 Aug 2019 14:55:27 +0000 (UTC)

On 8/14/19 4:00 AM, Jan Kara wrote:
> On Tue 13-08-19 07:55:06, Mark Salyzyn wrote:
> ...
>> diff --git a/fs/xattr.c b/fs/xattr.c
>> index 90dd78f0eb27..71f887518d6f 100644
>> --- a/fs/xattr.c
>> +++ b/fs/xattr.c
> ...
>>   ssize_t
>>   __vfs_getxattr(struct dentry *dentry, struct inode *inode, const char *name,
>> -	       void *value, size_t size)
>> +	       void *value, size_t size, int flags)
>>   {
>>   	const struct xattr_handler *handler;
>> -
>> -	handler = xattr_resolve_name(inode, &name);
>> -	if (IS_ERR(handler))
>> -		return PTR_ERR(handler);
>> -	if (!handler->get)
>> -		return -EOPNOTSUPP;
>> -	return handler->get(handler, dentry, inode, name, value, size);
>> -}
>> -EXPORT_SYMBOL(__vfs_getxattr);
>> -
>> -ssize_t
>> -vfs_getxattr(struct dentry *dentry, const char *name, void *value, size_t size)
>> -{
>> -	struct inode *inode = dentry->d_inode;
>>   	int error;
>>   
>> +	if (flags & XATTR_NOSECURITY)
>> +		goto nolsm;
> Hum, is it OK for XATTR_NOSECURITY to skip even the xattr_permission()
> check? I understand that for reads of security xattrs it actually does not
> matter in practice but conceptually that seems wrong to me as
> XATTR_NOSECURITY is supposed to skip just security-module checks to avoid
> recursion AFAIU.

Good catch I think.

I was attempting to make this change purely inert, no change in 
functionality, only a change in API. Adding a call to xattr_permission 
would incur a change in overall functionality, as it would introduce 
into the current and original __vfs_getxattr a call to xattr_permission 
that was not there before.

(I will have to defer the real answer and requirements to the security 
folks)

AFAIK you are correct, and to make the call would reduce the attack 
surface, trading a very small amount of CPU utilization, for a much 
larger amount of trust.

Given the long history of this patch set (for overlayfs) and the large 
amount of stakeholders, I would _prefer_ to submit a followup 
independent functionality/security change to _vfs_get_xattr _after_ this 
makes it in.

>
>> diff --git a/include/uapi/linux/xattr.h b/include/uapi/linux/xattr.h
>> index c1395b5bd432..1216d777d210 100644
>> --- a/include/uapi/linux/xattr.h
>> +++ b/include/uapi/linux/xattr.h
>> @@ -17,8 +17,9 @@
>>   #if __UAPI_DEF_XATTR
>>   #define __USE_KERNEL_XATTR_DEFS
>>   
>> -#define XATTR_CREATE	0x1	/* set value, fail if attr already exists */
>> -#define XATTR_REPLACE	0x2	/* set value, fail if attr does not exist */
>> +#define XATTR_CREATE	 0x1	/* set value, fail if attr already exists */
>> +#define XATTR_REPLACE	 0x2	/* set value, fail if attr does not exist */
>> +#define XATTR_NOSECURITY 0x4	/* get value, do not involve security check */
>>   #endif
> It seems confusing to export XATTR_NOSECURITY definition to userspace when
> that is kernel-internal flag. I'd just define it in include/linux/xattr.h
> somewhere from the top of flags space (like 0x40000000).
>
> Otherwise the patch looks OK to me (cannot really comment on the security
> module aspect of this whole thing though).

Good point. However, we do need to keep these flags together to reduce 
maintenance risk, I personally abhor two locations for flags bits even 
if one comes from the opposite bit-side; collisions are undetectable at 
build time. Although I have not gone through the entire thought 
experiment, I am expecting that fuse could possibly benefit from this 
flag (if exposed) since it also has a security recursion. That said, 
fuse is probably the example of a gaping wide attack surface if user 
space had access to it ... your xattr_permissions call addition 
requested above would be realistically, not just pedantically, required!

I have to respin the patch because of yet another hole in filesystem 
coverage (I blew the mechanical ubifs adjustment, adjusted the wrong 
function), so please do tell if my rationalizations above hit a note, or 
if I _need_ to make the changes in this patch (change it to a series?).

Thanks -- Mark Salyzyn


