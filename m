Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B6F633E31
	for <lists+cluster-devel@lfdr.de>; Tue, 22 Nov 2022 14:55:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669125321;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5iU3Hpkc/79sBspdwJuJHqr5Kn9U5ziqVacQ/9YHEe8=;
	b=h/OSTae43ANOFBr4olBi0YfdkcV7IzIzqKoA/JnweXJloOquNTxvpl7DyM2rI4c3Zbkbo2
	GJYG3qZQoPeVqVPXmQBSlW8kM+jQQBaeWlNXx6PBo2pjf/Rk8DgFW+2fsOZg+3OJrf5LO4
	ceSs4lczbln8TcktuWaHapuppn7IynQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-609-uu4nCsMbMMWU9Ks7pcTWUQ-1; Tue, 22 Nov 2022 08:55:18 -0500
X-MC-Unique: uu4nCsMbMMWU9Ks7pcTWUQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F26458E8CDA;
	Tue, 22 Nov 2022 13:54:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 039F82166B26;
	Tue, 22 Nov 2022 13:54:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9C579194658D;
	Tue, 22 Nov 2022 13:54:53 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D5D631946587 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 22 Nov 2022 13:54:50 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1A75340C83EF; Tue, 22 Nov 2022 13:54:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 10C8B40C83DC
 for <cluster-devel@redhat.com>; Tue, 22 Nov 2022 13:54:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3DD86806026
 for <cluster-devel@redhat.com>; Tue, 22 Nov 2022 13:54:44 +0000 (UTC)
Received: from out30-45.freemail.mail.aliyun.com
 (out30-45.freemail.mail.aliyun.com [115.124.30.45]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256)
 id us-mta-670-2mVsdw24NqCHFxKbql7sFQ-1; Tue, 22 Nov 2022 08:54:37 -0500
X-MC-Unique: 2mVsdw24NqCHFxKbql7sFQ-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R131e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046049;
 MF=joseph.qi@linux.alibaba.com; NM=1; PH=DS; RN=16; SR=0;
 TI=SMTPD_---0VVSj4Yo_1669125271
Received: from 30.32.119.53(mailfrom:joseph.qi@linux.alibaba.com
 fp:SMTPD_---0VVSj4Yo_1669125271) by smtp.aliyun-inc.com;
 Tue, 22 Nov 2022 21:54:33 +0800
Message-ID: <9cc55d4f-d864-aca5-78a0-ea7602c35176@linux.alibaba.com>
Date: Tue, 22 Nov 2022 21:54:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
To: Jeff Layton <jlayton@kernel.org>, Mark Fasheh <mark@fasheh.com>,
 Joel Becker <jlbec@evilplan.org>
References: <20221120210004.381842-1-jlayton@kernel.org>
 <0c6a44ff-409e-99b2-eaa9-fd6e87a9e104@linux.alibaba.com>
 <a731e688122d1a6fdb2f7bdbd71d403fa110e9f2.camel@kernel.org>
From: Joseph Qi <joseph.qi@linux.alibaba.com>
In-Reply-To: <a731e688122d1a6fdb2f7bdbd71d403fa110e9f2.camel@kernel.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: Re: [Cluster-devel] [PATCH] filelock: move file locking definitions
 to separate header file
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
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org, hch@lst.de,
 cluster-devel@redhat.com, devel@lists.orangefs.org,
 linux-fsdevel@vger.kernel.org, v9fs-developer@lists.sourceforge.net,
 ceph-devel@vger.kernel.org, linux-xfs@vger.kernel.org,
 linux-afs@lists.infradead.org, ocfs2-devel@oss.oracle.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/22/22 8:20 PM, Jeff Layton wrote:
> On Tue, 2022-11-22 at 09:51 +0800, Joseph Qi wrote:
>> Hi,
>>
>> On 11/21/22 4:59 AM, Jeff Layton wrote:
>>> The file locking definitions have lived in fs.h since the dawn of time,
>>> but they are only used by a small subset of the source files that
>>> include it.
>>>
>>> Move the file locking definitions to a new header file, and add the
>>> appropriate #include directives to the source files that need them. By
>>> doing this we trim down fs.h a bit and limit the amount of rebuilding
>>> that has to be done when we make changes to the file locking APIs.
>>>
>>> Signed-off-by: Jeff Layton <jlayton@kernel.org>
>>> ---
>>>  fs/9p/vfs_file.c          |   1 +
>>>  fs/afs/internal.h         |   1 +
>>>  fs/attr.c                 |   1 +
>>>  fs/ceph/locks.c           |   1 +
>>>  fs/cifs/cifsfs.c          |   1 +
>>>  fs/cifs/cifsglob.h        |   1 +
>>>  fs/cifs/cifssmb.c         |   1 +
>>>  fs/cifs/file.c            |   1 +
>>>  fs/cifs/smb2file.c        |   1 +
>>>  fs/dlm/plock.c            |   1 +
>>>  fs/fcntl.c                |   1 +
>>>  fs/file_table.c           |   1 +
>>>  fs/fuse/file.c            |   1 +
>>>  fs/gfs2/file.c            |   1 +
>>>  fs/inode.c                |   1 +
>>>  fs/ksmbd/smb2pdu.c        |   1 +
>>>  fs/ksmbd/vfs.c            |   1 +
>>>  fs/ksmbd/vfs_cache.c      |   1 +
>>>  fs/lockd/clntproc.c       |   1 +
>>>  fs/lockd/netns.h          |   1 +
>>>  fs/locks.c                |   1 +
>>>  fs/namei.c                |   1 +
>>>  fs/nfs/nfs4_fs.h          |   1 +
>>>  fs/nfs_common/grace.c     |   1 +
>>>  fs/nfsd/netns.h           |   1 +
>>>  fs/ocfs2/locks.c          |   1 +
>>>  fs/ocfs2/stack_user.c     |   1 +
>>
>> Seems it misses the related changes in:
>> fs/ocfs2/stackglue.c
>>
> 
> I was able to build ocfs2.ko just fine without any changes to
> stackglue.c. What problem do you see here?
> 
Okay, that's because there is prototype declaration in
fs/ocfs2/stackglue.h, and it seems has no real effect in current
version.

So it looks good to me. For ocfs2 part,
Acked-by: Joseph Qi <joseph.qi@linux.alibaba.com>

