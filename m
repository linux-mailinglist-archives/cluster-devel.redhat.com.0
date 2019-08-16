Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7A5904AD
	for <lists+cluster-devel@lfdr.de>; Fri, 16 Aug 2019 17:30:47 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 48F52317529B;
	Fri, 16 Aug 2019 15:30:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C3C375C1D6;
	Fri, 16 Aug 2019 15:30:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 447FE24BFC;
	Fri, 16 Aug 2019 15:30:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7GFUc7r000525 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 16 Aug 2019 11:30:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 356CE183C7; Fri, 16 Aug 2019 15:30:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F4BD18854
	for <cluster-devel@redhat.com>; Fri, 16 Aug 2019 15:30:35 +0000 (UTC)
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 678382A09C0
	for <cluster-devel@redhat.com>; Fri, 16 Aug 2019 15:30:34 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id 129so3303587pfa.4
	for <cluster-devel@redhat.com>; Fri, 16 Aug 2019 08:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=android.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=mfAPdWffqPCiWWdG0+diH1s9rsdeIRT69OHzvRcyJZE=;
	b=n1rDvKmVIIzl5LQ8693geFLmZfVk3SNTRXjV+iWc+8TCGMLKeW1iTeiBjvRiueqoqF
	D9q8mlFSvHVsZFYo8y0kE96uO6kmQFQLzsCMbZOk0QJBcZZXpIGyVUfhKCZdaUtIfVCv
	i/NoHfVU/jNOhInU0nZF00JzrYo84Kc4poGmJ+0xtP3BbotZEuJh4vLNcJnKiqpzbKqX
	VAVojoCQ9+7vUVRbeqlgJ3x1mKtd9gYqddIhEV1djd0QWV+eU6MOHKC8ZzBAyRJxBa4j
	h2AWL75nzhxsVUvXnKj119sMtgytuLB07uRnQLjRyRsPInJpSQZBT6UeAUBurB9zqibi
	wIrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=mfAPdWffqPCiWWdG0+diH1s9rsdeIRT69OHzvRcyJZE=;
	b=S/IIyO9aJzTw8BbNyTd6+fTIKtF8cUEH5TrsIHQJ+ozQA0KRFsvsyRDdSb55WNIOMS
	GyMdo2gtj3oyx34WaAaQ/CH47xFZ+H1FpS0fL8ie9czVZfhnpByirnVzwdBH9z6ZQLso
	jGd6GKGOBtr/ucrvdKTPmkCJ5aZmIxuPM92ACuo6KKIlgyV0pUKCkJB78JeqHWhWaA/g
	eD1/K48uPcBVlDsDkOX8fdrp2htVKIxHjlC1SPjjx/RDsz8xai5VrP6O231BNVeKOuDx
	FyjKBvcMW+Ox1ApHypWKdWLqBs3MbshGjFnLM7qsYWMursy2IreOxblcwJeukDaAwURR
	gqSQ==
X-Gm-Message-State: APjAAAXrsr+cVm/CDc9/3yBicMEcTX4PfVoYiiMYpFoFdcDz5Gy9fdUy
	UGPke/tMIsdkB+ZYoIauQcM68g==
X-Google-Smtp-Source: APXvYqydx2RtAVHirZjlmSa0Unc3LrMXkJsKHb448nh37ky9aF7sEwD8P8sx+d4AByX8L7k2WfP+gw==
X-Received: by 2002:a17:90a:77c9:: with SMTP id
	e9mr7407215pjs.141.1565969433680; 
	Fri, 16 Aug 2019 08:30:33 -0700 (PDT)
Received: from nebulus.mtv.corp.google.com
	([2620:15c:211:200:5404:91ba:59dc:9400])
	by smtp.googlemail.com with ESMTPSA id
	l4sm4355544pjq.9.2019.08.16.08.30.31
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 16 Aug 2019 08:30:32 -0700 (PDT)
To: James Morris <jmorris@namei.org>
References: <20190812193320.200472-1-salyzyn@android.com>
	<20190813084801.GA972@kroah.com>
	<alpine.LRH.2.21.1908160515130.12729@namei.org>
	<69889dec-5440-1472-ed57-380f45547581@android.com>
	<alpine.LRH.2.21.1908160825310.22623@namei.org>
From: Mark Salyzyn <salyzyn@android.com>
Message-ID: <92b1df4b-6433-7d01-9c08-23de10e8d527@android.com>
Date: Fri, 16 Aug 2019 08:30:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.21.1908160825310.22623@namei.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 16 Aug 2019 15:30:34 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]);
	Fri, 16 Aug 2019 15:30:34 +0000 (UTC) for IP:'209.85.210.196'
	DOMAIN:'mail-pf1-f196.google.com'
	HELO:'mail-pf1-f196.google.com' FROM:'salyzyn@android.com' RCPT:''
X-RedHat-Spam-Score: -0.099  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
	SPF_PASS) 209.85.210.196 mail-pf1-f196.google.com 209.85.210.196
	mail-pf1-f196.google.com <salyzyn@android.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.38
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Cc: Latchesar Ionkov <lucho@ionkov.net>, Dave Kleikamp <shaggy@kernel.org>,
	jfs-discussion@lists.sourceforge.net, kernel-team@android.com,
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
	=?UTF-8?Q?Ernesto_A=2e_Fern=c3=a1ndez?=
	<ernesto.mnd.fernandez@gmail.com>, cluster-devel@redhat.com,
	selinux@vger.kernel.org, linux-integrity@vger.kernel.org,
	Vyacheslav Dubeyko <slava@dubeyko.com>,
	Casey Schaufler <casey@schaufler-ca.com>,
	v9fs-developer@lists.sourceforge.net,
	Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
	Stephen Smalley <sds@tycho.nsa.gov>, linux-mm@kvack.org,
	devel@lists.orangefs.org, Serge Hallyn <serge@hallyn.com>,
	linux-cifs@vger.kernel.org,
	Eric Van Hensbergen <ericvh@gmail.com>, ecryptfs@vger.kernel.org,
	Josef Bacik <josef@toxicpanda.com>,
	reiserfs-devel@vger.kernel.org, Tejun Heo <tj@kernel.org>,
	linux-mtd@lists.infradead.org, David Sterba <dsterba@suse.com>,
	Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Paul Moore <paul@paul-moore.com>, linux-nfs@vger.kernel.org,
	Theodore Ts'o <tytso@mit.edu>, linux-fsdevel@vger.kernel.org,
	Joseph Qi <joseph.qi@linux.alibaba.com>,
	Mathieu Malaterre <malat@debian.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Fri, 16 Aug 2019 15:30:46 +0000 (UTC)

On 8/15/19 3:27 PM, James Morris wrote:
> On Thu, 15 Aug 2019, Mark Salyzyn wrote:
>
>> Good Idea, but using the same argument structure for set and get I would be
>> concerned about the loss of compiler protection for the buffer argument;
> Agreed, I missed that.

Sadly, the pattern of

struct getxattr_args args;

memset(&args, 0, sizeof(args));

args.xxxx = ...

__vfs_getxattr(&args};

...

__vfs_setxattr(&args);

would be nice, so maybe we need to cool our jets and instead:

struct xattr_gs_args {
	struct dentry *dentry;
	struct inode *inode;
	const char *name;
	union {
	        void *buffer;
	        const void *value;
	};
	size_t size;
	int flags;
};

value _must_ be referenced for all setxattr operations, buffer for getxattr operations (how can we enforce that?).

>> struct getxattr_args {
>> 	struct dentry *dentry;
>> 	struct inode *inode;
>> 	const char *name;
>> 	void *buffer;
>> 	size_t size;
>> 	int flags;
> Does 'get' need flags?
>
:-) That was the _whole_ point of the patch, flags is how we pass in the 
recursion so that a security/internal getxattr call has the rights to 
acquire the data in the lower layer(s).

-- Mark

