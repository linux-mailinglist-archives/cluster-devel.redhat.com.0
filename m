Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1147A77E9
	for <lists+cluster-devel@lfdr.de>; Wed, 20 Sep 2023 11:49:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695203374;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rkg9tbxTq6pJj5csNug/eDfUxuv8dlZEs8ZxbrqQ+Bs=;
	b=jNz1DWvLYGCYC0Z7EZxZ/6yTYGMCnQB+3ICx+ffBHUt5zMjkAEf66S5v+h5xp0Y+k3VuRa
	zwzxZ2H4iVEEE2eY8ryuwAJUe9Dzil1ErvXrVwVI82Eeru/uwhvnM03cWTOIO8adLnZkLQ
	WpXr/uIcbu6eKdIfuJaweyKHb/QU0zk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-201-57-7R4_rPQ6G0xEIjqWQ9A-1; Wed, 20 Sep 2023 05:49:31 -0400
X-MC-Unique: 57-7R4_rPQ6G0xEIjqWQ9A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2DA8D8039CF;
	Wed, 20 Sep 2023 09:49:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7AC3440C2064;
	Wed, 20 Sep 2023 09:49:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D799E1946595;
	Wed, 20 Sep 2023 09:49:21 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 12575194658D for <cluster-devel@listman.corp.redhat.com>;
 Tue, 19 Sep 2023 20:18:12 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E11C62156702; Tue, 19 Sep 2023 20:18:11 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D94622156701
 for <cluster-devel@redhat.com>; Tue, 19 Sep 2023 20:18:11 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BA6703812589
 for <cluster-devel@redhat.com>; Tue, 19 Sep 2023 20:18:11 +0000 (UTC)
Received: from mail.cs.ucla.edu (mail.cs.ucla.edu [131.179.128.66]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-262-8boUhfJyPketlTK5smTUnQ-1; Tue,
 19 Sep 2023 16:18:07 -0400
X-MC-Unique: 8boUhfJyPketlTK5smTUnQ-1
Received: from localhost (localhost [127.0.0.1])
 by mail.cs.ucla.edu (Postfix) with ESMTP id 750A03C00D18B;
 Tue, 19 Sep 2023 13:10:50 -0700 (PDT)
Received: from mail.cs.ucla.edu ([127.0.0.1])
 by localhost (mail.cs.ucla.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id AMNmxh8IWcZs; Tue, 19 Sep 2023 13:10:50 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.cs.ucla.edu (Postfix) with ESMTP id EB6833C00D18D;
 Tue, 19 Sep 2023 13:10:49 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.cs.ucla.edu EB6833C00D18D
X-Virus-Scanned: amavisd-new at mail.cs.ucla.edu
Received: from mail.cs.ucla.edu ([127.0.0.1])
 by localhost (mail.cs.ucla.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id G7UgTQUjBKrV; Tue, 19 Sep 2023 13:10:49 -0700 (PDT)
Received: from [192.168.254.12] (unknown [47.147.225.57])
 by mail.cs.ucla.edu (Postfix) with ESMTPSA id C37643C00D18B;
 Tue, 19 Sep 2023 13:10:48 -0700 (PDT)
Message-ID: <c8315110-4684-9b83-d6c5-751647037623@cs.ucla.edu>
Date: Tue, 19 Sep 2023 13:10:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
To: Jeff Layton <jlayton@kernel.org>, Bruno Haible <bruno@clisp.org>,
 Jan Kara <jack@suse.cz>, Xi Ruoyao <xry111@linuxfromscratch.org>,
 bug-gnulib@gnu.org
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
 <20230919110457.7fnmzo4nqsi43yqq@quack3>
 <1f29102c09c60661758c5376018eac43f774c462.camel@kernel.org>
 <4511209.uG2h0Jr0uP@nimes>
 <08b5c6fd3b08b87fa564bb562d89381dd4e05b6a.camel@kernel.org>
From: Paul Eggert <eggert@cs.ucla.edu>
Organization: UCLA Computer Science Department
In-Reply-To: <08b5c6fd3b08b87fa564bb562d89381dd4e05b6a.camel@kernel.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mailman-Approved-At: Wed, 20 Sep 2023 09:42:40 +0000
Subject: Re: [Cluster-devel] [PATCH v7 12/13] ext4: switch to multigrain
 timestamps
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
Cc: Latchesar Ionkov <lucho@ionkov.net>,
 Martin Brandenburg <martin@omnibond.com>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 linux-xfs@vger.kernel.org, "Darrick J. Wong" <djwong@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>, linux-unionfs@vger.kernel.org,
 David Howells <dhowells@redhat.com>, Chris Mason <clm@fb.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>, Hans de Goede <hdegoede@redhat.com>,
 Marc Dionne <marc.dionne@auristor.com>, codalist@coda.cs.cmu.edu,
 linux-afs@lists.infradead.org, linux-mtd@lists.infradead.org,
 Mike Marshall <hubcap@omnibond.com>, Paulo Alcantara <pc@manguebit.com>,
 Amir Goldstein <l@gmail.com>, Eric Van Hensbergen <ericvh@kernel.org>,
 Miklos Szeredi <miklos@szeredi.hu>, Richard Weinberger <richard@nod.at>,
 Mark Fasheh <mark@fasheh.com>, Hugh Dickins <hughd@google.com>,
 Tyler Hicks <code@tyhicks.com>, cluster-devel@redhat.com, coda@cs.cmu.edu,
 linux-mm@kvack.org, Ilya Dryomov <idryomov@gmail.com>,
 Iurii Zaikin <yzaikin@google.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Shyam Prasad N <sprasad@microsoft.com>, ecryptfs@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, ocfs2-devel@lists.linux.dev,
 linux-cifs@vger.kernel.org, Chao Yu <chao@kernel.org>,
 Josef Bacik <josef@toxicpanda.com>, Tom Talpey <tom@talpey.com>,
 Tejun Heo <tj@kernel.org>, Yue Hu <huyue2@coolpad.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Xiubo Li <xiubli@redhat.com>, Gao Xiang <xiang@kernel.org>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Jan Harkes <jaharkes@cs.cmu.edu>,
 Christian Brauner <brauner@kernel.org>, linux-ext4@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, Joseph Qi <joseph.qi@linux.alibaba.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, v9fs@lists.linux.dev,
 ntfs3@lists.linux.dev, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Steve French <sfrench@samba.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Jeffle Xu <jefflexu@linux.alibaba.com>,
 devel@lists.orangefs.org, Anna Schumaker <anna@kernel.org>,
 Jan Kara <jack@suse.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Sungjong Seo <sj1557.seo@samsung.com>, linux-erofs@lists.ozlabs.org,
 linux-nfs@vger.kernel.org, linux-btrfs@vger.kernel.org,
 Joel Becker <jlbec@evilplan.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: cs.ucla.edu
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023-09-19 09:31, Jeff Layton wrote:
> The typical case for make
> timestamp comparisons is comparing source files vs. a build target. If
> those are being written nearly simultaneously, then that could be an
> issue, but is that a typical behavior?

I vaguely remember running into problems with 'make' a while ago 
(perhaps with a BSDish system) when filesystem timestamps were 
arbitrarily truncated in some cases but not others. These files would 
look older than they really were, so 'make' would think they were 
up-to-date when they weren't, and 'make' would omit actions that it 
should have done, thus screwing up the build.

File timestamps can be close together with 'make -j' on fast hosts. 
Sometimes a shell script (or 'make' itself) will run 'make', then modify 
a file F, then immediately run 'make' again; the latter 'make' won't 
work if F's timestamp is mistakenly older than targets that depend on it.

Although 'make'-like apps are the biggest canaries in this coal mine, 
the issue also affects 'find -newer' (as Bruno mentioned), 'rsync -u', 
'mv -u', 'tar -u', Emacs file-newer-than-file-p, and surely many other 
places. For example, any app that creates a timestamp file, then backs 
up all files newer than that file, would be at risk.


> I wonder if it would be feasible to just advance the coarse-grained
> current_time whenever we end up updating a ctime with a fine-grained
> timestamp?

Wouldn't this need to be done globally, that is, not just on a per-file 
or per-filesystem basis? If so, I don't see how we'd avoid locking 
performance issues.


PS. Although I'm no expert in the Linux inode code I hope you don't mind 
my asking a question about this part of inode_set_ctime_current:

	/*
	 * If we've recently updated with a fine-grained timestamp,
	 * then the coarse-grained one may still be earlier than the
	 * existing ctime. Just keep the existing value if so.
	 */
	ctime.tv_sec = inode->__i_ctime.tv_sec;
	if (timespec64_compare(&ctime, &now) > 0)
		return ctime;

Suppose root used clock_settime to set the clock backwards. Won't this 
code incorrectly refuse to update the file's timestamp afterwards? That 
is, shouldn't the last line be "goto fine_grained;" rather than "return 
ctime;", with the comment changed from "keep the existing value" to "use 
a fine-grained value"?

