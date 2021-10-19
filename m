Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD2B433B78
	for <lists+cluster-devel@lfdr.de>; Tue, 19 Oct 2021 18:01:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634659261;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+/pkobYQmFSVPtB7/1zAAgkGIOuOGumz0nqsWSm3uLo=;
	b=P1TjWO/KjvXP8XtFtNSjcm4RkPFqn+k5Nd6itmRvxnXOxuaHkAzPgNqdj1B4/1TWpJ/rFW
	HpImXynTWPegGSWG5F6FVzWgcdjG52C5N93G1izaqBNrWunnMlve/1G9m6Oth3aKmSNvAg
	k+Pv5U1yX3BCyuEzYfqWVLm2DShy4QU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-WklN5Ho6Mu692DnGCzdCGw-1; Tue, 19 Oct 2021 12:00:57 -0400
X-MC-Unique: WklN5Ho6Mu692DnGCzdCGw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8774D100C660;
	Tue, 19 Oct 2021 16:00:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 773715DD68;
	Tue, 19 Oct 2021 16:00:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0D9E21801241;
	Tue, 19 Oct 2021 16:00:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19JG0oLv007849 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 19 Oct 2021 12:00:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 734D740CFD12; Tue, 19 Oct 2021 16:00:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E56C40CFD10
	for <cluster-devel@redhat.com>; Tue, 19 Oct 2021 16:00:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 554FA8027FB
	for <cluster-devel@redhat.com>; Tue, 19 Oct 2021 16:00:50 +0000 (UTC)
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
	[209.85.166.72]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-155-t6Sz5cXQPGmhKgDqeICZXA-1; Tue, 19 Oct 2021 12:00:49 -0400
X-MC-Unique: t6Sz5cXQPGmhKgDqeICZXA-1
Received: by mail-io1-f72.google.com with SMTP id
	f13-20020a5ec60d000000b005ddbc52304dso13665411iok.8
	for <cluster-devel@redhat.com>; Tue, 19 Oct 2021 09:00:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
	:content-language:to:cc:references:from:in-reply-to
	:content-transfer-encoding;
	bh=+/pkobYQmFSVPtB7/1zAAgkGIOuOGumz0nqsWSm3uLo=;
	b=lv83gUAbRETKailgSPZg2tUm+DQvwpc/TNqHROCjvWqafOHOLZ1JtHQ20Sn5iy8xa1
	N8IkYwcp6ggiR1owileWSLgjoW7DAhkfRcNUedXBoRTZ1FDMQTALTjQVbcrfGM8y9fhx
	6JB5leqOhoT6wop0KU+ngJFaGTEQ0qg3XcVTmOJZ0q4rcJR3Q+QEGScvZetyt1Ln9qDh
	DbfMK8Czhv1W2fcKjoYt0aWx1DDh6afiTcQA4IclDthU5l7B+R2MZ02cBZCk5shCWSBc
	zcoZTLTu9crYKg7jV3PikoKQM3NVjMqzjKmjYSrxmG/FgF+cXHVQrY02LipmztdX3kzf
	CX6Q==
X-Gm-Message-State: AOAM5339mFGyhcYvD/pY4G2PUv3Z15vcxpJpq0G/d3AvylKFo+cfYRDf
	TmFSb5He/ju8dUDWCtN/p+q4k6T4s91gzCkc3qjWFqVzo2EX/fvgyPNLCJZQmGvT2F56+fiNy5Y
	KFJDULq7d5SFSjKl7sOaibA==
X-Received: by 2002:a92:ad07:: with SMTP id w7mr964695ilh.162.1634659248221;
	Tue, 19 Oct 2021 09:00:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzAZfB7m5Nwi7iGOdqLp7ZjGTVP9iLTlfNdmkJjBBh89jyJbqtVZTUIyhlFM83/SHsC93WNcw==
X-Received: by 2002:a92:ad07:: with SMTP id w7mr964668ilh.162.1634659248043;
	Tue, 19 Oct 2021 09:00:48 -0700 (PDT)
Received: from [172.16.0.19] ([205.214.171.149])
	by smtp.gmail.com with ESMTPSA id
	i18sm9324101ila.32.2021.10.19.09.00.46
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 19 Oct 2021 09:00:47 -0700 (PDT)
Message-ID: <d28b1ea4-6834-816e-a01a-f1bd0862e84e@redhat.com>
Date: Tue, 19 Oct 2021 11:00:45 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
	Thunderbird/91.1.0
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Andreas Gruenbacher <agruenba@redhat.com>
References: <20211019134204.3382645-1-agruenba@redhat.com>
	<CAHk-=wh0_3y5s7-G74U0Pcjm7Y_yHB608NYrQSvgogVNBxsWSQ@mail.gmail.com>
From: Bob Peterson <rpeterso@redhat.com>
In-Reply-To: <CAHk-=wh0_3y5s7-G74U0Pcjm7Y_yHB608NYrQSvgogVNBxsWSQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-loop: cluster-devel@redhat.com
Cc: kvm-ppc@vger.kernel.org, cluster-devel <cluster-devel@redhat.com>,
	Jan Kara <jack@suse.cz>, Catalin Marinas <catalin.marinas@arm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>, Paul Mackerras <paulus@ozlabs.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	"Darrick J. Wong" <djwong@kernel.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	linux-btrfs <linux-btrfs@vger.kernel.org>, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v8 00/17] gfs2: Fix mmap + page fault
	deadlocks
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/19/21 10:40 AM, Linus Torvalds wrote:
> On Tue, Oct 19, 2021 at 3:42 AM Andreas Gruenbacher <agruenba@redhat.com> wrote:
>>
>>  From my point of view, the following questions remain:
>>
>>   * I hope these patches will be merged for v5.16, but what process
>>     should I follow for that?  The patch queue contains mm and iomap
>>     changes, so a pull request from the gfs2 tree would be unusual.
> 
> Oh, I'd much rather get these as one pull request from the author and
> from the person that actually ended up testing this.

Hi Linus,

FWIW, I've been working with Andreas on this and have tested it quite
extensively, although only with gfs2. I've tested it with numerous
scenarios, both stand-alone (xfstests as well as several other test
programs I have in my collection) and in a cluster with some very heavy
duty cluster coherency tests. My testing is nearly complete, but not
quite.

Regards,

Bob Peterson
GFS2 File System

