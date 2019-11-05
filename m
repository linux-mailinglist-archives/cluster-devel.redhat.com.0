Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id B64A6F0199
	for <lists+cluster-devel@lfdr.de>; Tue,  5 Nov 2019 16:37:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572968248;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2/8/BwrhtmEXI7dj68SMTpCzdsjoLETsRSfZ5j8yePw=;
	b=i/Y7EFhxtjunSPiNCiS531tPmC9VJztZotquSYz8jAtaxpL/ELU9kMbok/LZM7rsPiyldR
	lHgf2XfDkrWpMYJg6Vc1KUdT99TLBkja+PUvIGt8r46G9DLIARGWTF8RHx4Mm7lRwaSOJi
	CqDEBcYk+Y2lh69dvC3IZX4ZKfSbJl4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-C6kGJA1JOO2tQvDVHxdnlw-1; Tue, 05 Nov 2019 10:37:27 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F0A9E1005509;
	Tue,  5 Nov 2019 15:37:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D48010027A4;
	Tue,  5 Nov 2019 15:37:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 158C018034EA;
	Tue,  5 Nov 2019 15:37:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA5FbCLU014635 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 5 Nov 2019 10:37:12 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2DB2D600C8; Tue,  5 Nov 2019 15:37:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 27C76600C6
	for <cluster-devel@redhat.com>; Tue,  5 Nov 2019 15:37:09 +0000 (UTC)
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7EB68307BD02
	for <cluster-devel@redhat.com>; Tue,  5 Nov 2019 15:37:08 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id l24so14466317pgh.10
	for <cluster-devel@redhat.com>; Tue, 05 Nov 2019 07:37:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=2/8/BwrhtmEXI7dj68SMTpCzdsjoLETsRSfZ5j8yePw=;
	b=OiK/2pLCG4e2aYuFW/nIuJsffpmvxIXVu7uL2RUY6kb/EyyY7V1jMk+LSGOjtoTBS7
	06eIwYHlko+DC+/7hOp6NKVTG8ivkWKJawOM1QpMjfuV0k086Cl6OdF3yXxB1nB7UkCj
	88p9a4dRTZMJCA68nBta/j0gOEXuc+QtFKsZt6yDGk7J1wyHYe7Lj/FiMEK6K0fYnUyk
	REFbEimgaEwPrBXwhabDQCMS8VrhXB+ojz0OTlIL3NVi+/ilEJLjN6kdB1WJBi46mczC
	F7ou211BFE6aRQ1y3QS8I4FZKpP20nAeLA3XYwiY1nHgDtqBFvfsfwsEb4LUfkNq40hm
	v9Xw==
X-Gm-Message-State: APjAAAWzvi8NttU9OVni6++Ps1nxWIM4EpDY2Pb1DJZUUejo7pik+k8c
	XUsrsAiKZXllqwWED8uzas7I/A==
X-Google-Smtp-Source: APXvYqy6Q+jW7Nx8yhUJvITL/ENlgb+bvGP0zh9whSnmepYB/pthS+WgqdQwDBfJOEs5VO1iezn2Pw==
X-Received: by 2002:a62:e519:: with SMTP id n25mr38428065pff.144.1572968227784;
	Tue, 05 Nov 2019 07:37:07 -0800 (PST)
Received: from nebulus.mtv.corp.google.com
	([2620:15c:211:200:5404:91ba:59dc:9400])
	by smtp.googlemail.com with ESMTPSA id
	m13sm18037460pga.70.2019.11.05.07.37.05
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 05 Nov 2019 07:37:07 -0800 (PST)
To: Jan Kara <jack@suse.cz>
References: <20191104215253.141818-1-salyzyn@android.com>
	<20191104215253.141818-2-salyzyn@android.com>
	<20191105094830.GL22379@quack2.suse.cz>
From: Mark Salyzyn <salyzyn@android.com>
Message-ID: <1de43656-e751-53a2-c0da-ff44ecbabbc4@android.com>
Date: Tue, 5 Nov 2019 07:37:04 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191105094830.GL22379@quack2.suse.cz>
Content-Language: en-GB
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Tue, 05 Nov 2019 15:37:08 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]);
	Tue, 05 Nov 2019 15:37:08 +0000 (UTC) for IP:'209.85.215.193'
	DOMAIN:'mail-pg1-f193.google.com'
	HELO:'mail-pg1-f193.google.com' FROM:'salyzyn@android.com' RCPT:''
X-RedHat-Spam-Score: -0.099  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
	SPF_PASS) 209.85.215.193 mail-pg1-f193.google.com 209.85.215.193
	mail-pg1-f193.google.com <salyzyn@android.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.49
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: Latchesar Ionkov <lucho@ionkov.net>, Dave Kleikamp <shaggy@kernel.org>,
	jfs-discussion@lists.sourceforge.net, linux-doc@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Martin Brandenburg <martin@omnibond.com>, samba-technical@lists.samba.org,
	Dominique Martinet <asmadeus@codewreck.org>,
	Artem Bityutskiy <dedekind1@gmail.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	David Howells <dhowells@redhat.com>, Chris Mason <clm@fb.com>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Eric Paris <eparis@parisplace.org>,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	netdev@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-afs@lists.infradead.org,
	Mike Marshall <hubcap@omnibond.com>, linux-xfs@vger.kernel.org,
	linux-unionfs@vger.kernel.org, Sage Weil <sage@redhat.com>,
	"Darrick J . Wong" <darrick.wong@oracle.com>,
	Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
	Eric Biggers <ebiggers@google.com>, Hugh Dickins <hughd@google.com>,
	James Morris <jmorris@namei.org>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	cluster-devel@redhat.com, selinux@vger.kernel.org,
	linux-integrity@vger.kernel.org, Casey Schaufler <casey@schaufler-ca.com>,
	v9fs-developer@lists.sourceforge.net,
	Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
	Stephen Smalley <sds@tycho.nsa.gov>, linux-mm@kvack.org,
	Mark Salyzyn <salyzyn@google.com>,
	Serge Hallyn <serge@hallyn.com>, ecryptfs@vger.kernel.org,
	linux-cifs@vger.kernel.org, Eric Van Hensbergen <ericvh@gmail.com>,
	Chao Yu <chao@kernel.org>, linux-erofs@lists.ozlabs.org,
	Josef Bacik <josef@toxicpanda.com>, reiserfs-devel@vger.kernel.org,
	Miklos Szeredi <miklos@szeredi.hu>, linux-mtd@lists.infradead.org,
	Phillip Lougher <phillip@squashfs.org.uk>, David Sterba <dsterba@suse.com>,
	Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
	devel@lists.orangefs.org, Gao Xiang <xiang@kernel.org>,
	Mimi Zohar <zohar@linux.ibm.com>,
	Paul Moore <paul@paul-moore.com>, linux-nfs@vger.kernel.org,
	Theodore Ts'o <tytso@mit.edu>, linux-fsdevel@vger.kernel.org,
	Joseph Qi <joseph.qi@linux.alibaba.com>,
	Mathieu Malaterre <malat@debian.org>, kernel-team@android.com,
	Jonathan Corbet <corbet@lwn.net>,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	Tyler Hicks <tyhicks@canonical.com>, Steve French <sfrench@samba.org>,
	linux-security-module@vger.kernel.org,
	ocfs2-devel@oss.oracle.com, Jan Kara <jack@suse.com>,
	Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Anna Schumaker <anna.schumaker@netapp.com>, linux-btrfs@vger.kernel.org,
	Alexander Viro <viro@zeniv.linux.org.uk>
Subject: Re: [Cluster-devel] [PATCH v15 1/4] Add flags option to get xattr
 method paired to __vfs_getxattr
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
X-MC-Unique: C6kGJA1JOO2tQvDVHxdnlw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/5/19 1:48 AM, Jan Kara wrote:
>> @@ -228,11 +228,11 @@ static int afs_xattr_get_yfs(const struct xattr_handler *handler,
>>   		break;
>>   	case 1:
>>   		data = buf;
>> -		dsize = snprintf(buf, sizeof(buf), "%u", yacl->inherit_flag);
>> +		dsize = scnprintf(buf, sizeof(buf), "%u", yacl->inherit_flag);
>>   		break;
>>   	case 2:
>>   		data = buf;
>> -		dsize = snprintf(buf, sizeof(buf), "%u", yacl->num_cleaned);
>> +		dsize = scnprintf(buf, sizeof(buf), "%u", yacl->num_cleaned);
>>   		break;
>>   	case 3:
> These scnprintf() changes (and there are more in the patch) probably
> shouldn't be here... Otherwise the patch still looks good to me :).
>
> 								Honza
>
Good catch, they were done in locality, I forgot about them, this patch 
series has been living for almost a year now and time has become its 
enemy ... will spin this as a separate patch. They strike as a security 
issue with the possibility of fragile UAF when the code is maintained by 
future selves.

-- Mark

