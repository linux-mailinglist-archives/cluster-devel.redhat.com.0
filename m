Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1267984EF
	for <lists+cluster-devel@lfdr.de>; Fri,  8 Sep 2023 11:42:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694166127;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rWH+VGW4ynUEnqVgfK8Uo5vbTneevGaezyT5mB/sqg4=;
	b=SLFM6SsfvXY4dQAMnbKB5NXo2Kh3E8OwtBAL1KobQT1LTsKBA78ZpbEy3Mo9NHSaXZR7r4
	k+lxr8lr2Un5CWTB1aAFnlvJJ70c/70lfAsdtJfkOQABHbh3hjvUiJdtx4YFtrKtkJOqHS
	yCLOw8decWMeURNeKeoGRlY6qtiyan8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-539-g8DkVnEoPJq0xSu6WkZFBA-1; Fri, 08 Sep 2023 05:42:05 -0400
X-MC-Unique: g8DkVnEoPJq0xSu6WkZFBA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 216168279AA;
	Fri,  8 Sep 2023 09:42:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9D082412F2CE;
	Fri,  8 Sep 2023 09:42:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 293201946597;
	Fri,  8 Sep 2023 09:42:02 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D7714194658C for <cluster-devel@listman.corp.redhat.com>;
 Fri,  8 Sep 2023 00:30:26 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BED4D63F6C; Fri,  8 Sep 2023 00:30:26 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B72AE7B62
 for <cluster-devel@redhat.com>; Fri,  8 Sep 2023 00:30:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 95ADD1817929
 for <cluster-devel@redhat.com>; Fri,  8 Sep 2023 00:30:26 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-ahrpmCrZOB6aVEDDhVGXTA-1; Thu, 07 Sep 2023 20:30:23 -0400
X-MC-Unique: ahrpmCrZOB6aVEDDhVGXTA-1
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-9a2a4a5472dso575101066b.1; 
 Thu, 07 Sep 2023 17:30:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694133021; x=1694737821;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rWH+VGW4ynUEnqVgfK8Uo5vbTneevGaezyT5mB/sqg4=;
 b=dnF/uDUfuVbAOiKTbYgUweA0275ue7DyIZnkCHeWJX84KyZBiqR37zy/4WUXjUSqy/
 y38fI+5EK6QIrvTksSu7fMWwZNzbVRyBkmGQHuzZcTBO0ygmod8WBUzLH7Y3QLqB8p11
 xMaYcbi4aqJ/HYRE+MKQ+t9RKX/Dz6/RPTgfMbPwXn64FtFyQb5e+fx7dYBGSWOkA4VP
 Y8ShkSsBdz02nMCg2995hnYtj8Rkpqphg5PdtoOwr/N2ZBkO/WZYBIy+hZ+2gIcgEWhK
 V+NfR5PTeLHmbgjXPf5Dtn3GmjwqN6W7vG9gRvZ92pT32OXcoLdhlONBh1XiA+2nmGRu
 GMyA==
X-Gm-Message-State: AOJu0YzZZEmYPnwidfpU/BDF6SeoqVLHR9AbQ3+X/zob+Q6XrD5rxXkt
 v6Ew/Rrl2DgeIeSyPaqY+8LdgXKG3nGCxA==
X-Google-Smtp-Source: AGHT+IHUmcSd3yGn0Yc+fxHKH36GJLlYUzap6qvtcfMqwZgOcAgDOYhbcm3dJF4+eYZ9U6PvPuYQ6g==
X-Received: by 2002:a17:907:6e87:b0:9a1:c69c:9388 with SMTP id
 sh7-20020a1709076e8700b009a1c69c9388mr4152809ejc.37.1694133021412; 
 Thu, 07 Sep 2023 17:30:21 -0700 (PDT)
Received: from [192.168.8.100] ([148.252.141.16])
 by smtp.gmail.com with ESMTPSA id
 lz24-20020a170906fb1800b009932337747esm280974ejb.86.2023.09.07.17.30.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Sep 2023 17:30:21 -0700 (PDT)
Message-ID: <6489b8cb-7d54-1e29-f192-a3449ed87fa1@gmail.com>
Date: Fri, 8 Sep 2023 01:29:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dave Chinner <david@fromorbit.com>, Hao Xu <hao.xu@linux.dev>
References: <20230827132835.1373581-1-hao.xu@linux.dev>
 <20230827132835.1373581-8-hao.xu@linux.dev>
 <ZOvA5DJDZN0FRymp@casper.infradead.org>
 <c728bf3f-d9db-4865-8473-058b26c11c06@linux.dev>
 <ZO3cI+DkotHQo3md@casper.infradead.org>
 <642de4e6-801d-fcad-a7ce-bfc6dec3b6e5@linux.dev>
 <ZPUJHAKzxvXiEDYA@dread.disaster.area>
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <ZPUJHAKzxvXiEDYA@dread.disaster.area>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mailman-Approved-At: Fri, 08 Sep 2023 09:42:00 +0000
Subject: Re: [Cluster-devel] [PATCH 07/11] vfs: add nowait parameter for
 file_accessed()
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
Cc: Wanpeng Li <wanpengli@tencent.com>, "Darrick J . Wong" <djwong@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Stefan Roesch <shr@fb.com>, Clay Harris <bugs@claycon.org>,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, codalist@coda.cs.cmu.edu,
 cluster-devel@redhat.com, linux-cachefs@redhat.com, linux-ext4@vger.kernel.org,
 devel@lists.orangefs.org, linux-cifs@vger.kernel.org, ecryptfs@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-block@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, io-uring@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 netdev@vger.kernel.org, samba-technical@lists.samba.org,
 linux-unionfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, bpf@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/3/23 23:30, Dave Chinner wrote:
> On Wed, Aug 30, 2023 at 02:11:31PM +0800, Hao Xu wrote:
>> On 8/29/23 19:53, Matthew Wilcox wrote:
>>> On Tue, Aug 29, 2023 at 03:46:13PM +0800, Hao Xu wrote:
>>>> On 8/28/23 05:32, Matthew Wilcox wrote:
>>>>> On Sun, Aug 27, 2023 at 09:28:31PM +0800, Hao Xu wrote:
>>>>>> From: Hao Xu <howeyxu@tencent.com>
>>>>>>
>>>>>> Add a boolean parameter for file_accessed() to support nowait semantics.
>>>>>> Currently it is true only with io_uring as its initial caller.
>>>>>
>>>>> So why do we need to do this as part of this series?  Apparently it
>>>>> hasn't caused any problems for filemap_read().
>>>>>
>>>>
>>>> We need this parameter to indicate if nowait semantics should be enforced in
>>>> touch_atime(), There are locks and maybe IOs in it.
>>>
>>> That's not my point.  We currently call file_accessed() and
>>> touch_atime() for nowait reads and nowait writes.  You haven't done
>>> anything to fix those.
>>>
>>> I suspect you can trim this patchset down significantly by avoiding
>>> fixing the file_accessed() problem.  And then come back with a later
>>> patchset that fixes it for all nowait i/o.  Or do a separate prep series
>>
>> I'm ok to do that.
>>
>>> first that fixes it for the existing nowait users, and then a second
>>> series to do all the directory stuff.
>>>
>>> I'd do the first thing.  Just ignore the problem.  Directory atime
>>> updates cause I/O so rarely that you can afford to ignore it.  Almost
>>> everyone uses relatime or nodiratime.
>>
>> Hi Matthew,
>> The previous discussion shows this does cause issues in real
>> producations: https://lore.kernel.org/io-uring/2785f009-2ebb-028d-8250-d5f3a30510f0@gmail.com/#:~:text=fwiw%2C%20we%27ve%20just%20recently%20had%20similar%20problems%20with%20io_uring%20read/write
>>
> 
> Then separate it out into it's own patch set so we can have a
> discussion on the merits of requiring using noatime, relatime or
> lazytime for really latency sensitive IO applications. Changing code
> is not always the right solution...

Separation sounds reasonable, but it can hardly be said that only
latency sensitive apps would care about >1s nowait/async submission
delays. Presumably, btrfs can improve on that, but it still looks
like it's perfectly legit for filesystems do heavy stuff in
timestamping like waiting for IO. Right?

-- 
Pavel Begunkov

