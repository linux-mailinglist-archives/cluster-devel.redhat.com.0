Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 69B6F414990
	for <lists+cluster-devel@lfdr.de>; Wed, 22 Sep 2021 14:47:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1632314874;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=DQdDEGMA37Xk7HaI0j+vw+DQm0eLkXAaKyZYIDPSFzE=;
	b=TS4P8g0nK/e3oYKx4nEnh0TML0jaoUN3YrrMsTay5RJtrqXzCtSjUe/LE88JxseqPWB6um
	sVZba1UAq3txUf2bNxb7D1aBGhvI83sj1MBQTxT5+I7+WAgbLZTA4bt5hYZAst1RUz3tiH
	xx727c4Fzj7+zCMSWA63CWh1RBJ9uiU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-2x0nKWVCOySA5ShMhbJb1Q-1; Wed, 22 Sep 2021 08:47:52 -0400
X-MC-Unique: 2x0nKWVCOySA5ShMhbJb1Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5CD03100C609;
	Wed, 22 Sep 2021 12:47:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3FE8F60C5F;
	Wed, 22 Sep 2021 12:47:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EC17A4E58E;
	Wed, 22 Sep 2021 12:47:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18MClkK2019436 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 22 Sep 2021 08:47:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 01D09202864E; Wed, 22 Sep 2021 12:47:46 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E0E942138D17
	for <cluster-devel@redhat.com>; Wed, 22 Sep 2021 12:47:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4BAFD185A7A4
	for <cluster-devel@redhat.com>; Wed, 22 Sep 2021 12:47:41 +0000 (UTC)
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
	[209.85.166.197]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-203-h84RWlKwNiGdvEoxG0zJyA-1; Wed, 22 Sep 2021 08:47:40 -0400
X-MC-Unique: h84RWlKwNiGdvEoxG0zJyA-1
Received: by mail-il1-f197.google.com with SMTP id
	f4-20020a056e0204c400b0022dbd3f8b18so2530552ils.2
	for <cluster-devel@redhat.com>; Wed, 22 Sep 2021 05:47:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
	:content-language:to:cc:references:from:in-reply-to
	:content-transfer-encoding;
	bh=DQdDEGMA37Xk7HaI0j+vw+DQm0eLkXAaKyZYIDPSFzE=;
	b=E458Zde2qxC1GepWdu9N17ubf3eQt+R2TFMrGfD3hkVRN/Pzl/toyiRI8/dxtTMblR
	HQ+2+zj3IAORZb9oX/1kWymzsApf6138Qo2UQpRQ1Y5kCu7LxpUSfKvPQllzhDKf3aU8
	+Y2/T+FYX+aaCegA4Q94Je5wRZsm2Q4LGQD0rvi7P7QdKFnfD23cYteOIpjxicN+YlkV
	W3txeBF+M5dBFZzwxkhSEJAMAFe8pm/iUWilYDr3aZC8odVVmCQTALOBdZsYUcCYzZtv
	+kOsTIB+qoFkGqxQO6oLOVnooWiqAgpCCUTNy0xuTP2j89I48FdGfr+k1bGwp847QLhU
	mZpg==
X-Gm-Message-State: AOAM530con2H4wHXMgwU9HAizUami0yN3ILiggqzuwe6LUQ33aONtBUW
	8V33eT4KxKhYFI3AgtPSan29Ot8ng0v5yNLF1EV9wtCIrvkL8H0nKxid4i71/W22Asuflfv8nI2
	eJV8ZMCOGyW2smysLlylXMg==
X-Received: by 2002:a05:6638:1909:: with SMTP id
	p9mr4703114jal.108.1632314859302; 
	Wed, 22 Sep 2021 05:47:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwYryBebL0zDhJmUcPEB0iZMJIXxC2qeGqGtGKaysJ28ehFNU5nitr3w8ye+i86E+EjxRmY2g==
X-Received: by 2002:a05:6638:1909:: with SMTP id
	p9mr4702796jal.108.1632314854244; 
	Wed, 22 Sep 2021 05:47:34 -0700 (PDT)
Received: from [172.16.0.19] (209-212-39-192.brainerd.net. [209.212.39.192])
	by smtp.gmail.com with ESMTPSA id d6sm1012069ile.51.2021.09.22.05.47.33
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 22 Sep 2021 05:47:33 -0700 (PDT)
Message-ID: <7c83e1ac-5ec6-b008-51d0-11d978ec642f@redhat.com>
Date: Wed, 22 Sep 2021 07:47:32 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
	Thunderbird/91.1.0
To: Andreas Gruenbacher <agruenba@redhat.com>
References: <20210916191003.105866-1-rpeterso@redhat.com>
	<20210916191003.105866-7-rpeterso@redhat.com>
	<CAHc6FU5=0U-mv8Jdu+RtJ2DKXCA7q0DPMfwNUGFrd2v_QKDiiw@mail.gmail.com>
From: Bob Peterson <rpeterso@redhat.com>
In-Reply-To: <CAHc6FU5=0U-mv8Jdu+RtJ2DKXCA7q0DPMfwNUGFrd2v_QKDiiw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH v2 6/6] gfs2: introduce and use new
 glops go_lock_needed
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/22/21 6:57 AM, Andreas Gruenbacher wrote:
> On Thu, Sep 16, 2021 at 9:11 PM Bob Peterson <rpeterso@redhat.com> wrote:
>> Before this patch, when a glock was locked, the very first holder on the
>> queue would unlock the lockref and call the go_lock glops function (if
>> one exists), unless GL_SKIP was specified. When we introduced the new
>> node-scope concept, we allowed multiple holders to lock glocks in EX mode
>> and share the lock, but node-scope introduced a new problem: if the
>> first holder has GL_SKIP and the next one does NOT, since it is not the
>> first holder on the queue, the go_lock op was not called.
> 
> We use go_lock to (re)validate inodes (for inode glocks) and to read
> in bitmaps (for resource group glocks). I can see how calling go_lock
> was originally tied to the first lock holder, but GL_SKIP already
> broke the simple model that the first holder will call go_lock. The
> go_lock_needed callback only makes things worse yet again,
> unfortunately.

In what way does go_lock_needed make things worse?

> How about we introduce a new GLF_REVALIDATE flag that indicates that
> go_lock needs to be called? The flag would be set when instantiating a
> new glock and when dequeuing the last holder, and cleared in go_lock
> (and in gfs2_inode_refresh for GL_SKIP holders). I'm not sure if

That was my original design, and it makes the most sense. I named the 
flag GLF_GO_LOCK_SKIPPED, but essentially the same thing. Unfortunately, 
I ran into all kinds of problems implementing it. In those patches, 
first holders would either call glops->go_lock() or set 
GLF_GO_LOCK_SKIPPED. Once the go_lock function was complete, it cleared 
GLF_GO_LOCK_SKIPPED, and called wake_up_bit. Secondary holders did 
wait_on_bit and waited for the other process's go_lock to complete.

But I had tons of problems getting this to work properly. Processes 
would hang and deadlock for seemingly no reason. Finally I got 
frustrated and sought other solutions.

I'm willing to try to resurrect that patch set and try again. Maybe you 
can help me figure out what I'm doing wrong and why it's not working.

Bob Peterson

> GLF_REVALIDATE can fully replace GIF_INVALID as well, but it looks
> like it at first glance.
> 
> Thanks,
> Andreas

