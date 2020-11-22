Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2E0052C0C99
	for <lists+cluster-devel@lfdr.de>; Mon, 23 Nov 2020 15:10:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1606140624;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=eSFXaX0DZkpNbOwM/RCeF/BEd3n14fz/kurtk7pTmoY=;
	b=DKNoPtvb2KXBvgT9/0Z5sliw0iDRLxjg68KoOnjuxphCA9D2438rvnrzPvo5jh3Dp4fbxB
	t0gs8k7mJno+KLxuRcIkvpFD0iyCyDR+zQNSejee06q2FxpB/44aOcIsexqt6sdNuqwqzu
	wg2CWehoamZJm7xlAKeTdsnGubq4D/E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-3liRy_0cPTuK_143-urvsQ-1; Mon, 23 Nov 2020 09:10:21 -0500
X-MC-Unique: 3liRy_0cPTuK_143-urvsQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC077100F344;
	Mon, 23 Nov 2020 14:10:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8513E5D9E3;
	Mon, 23 Nov 2020 14:10:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EFAAA1809CAB;
	Mon, 23 Nov 2020 14:02:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AMGXQMQ016869 for <cluster-devel@listman.util.phx.redhat.com>;
	Sun, 22 Nov 2020 11:33:26 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 64F4F2166B2B; Sun, 22 Nov 2020 16:33:26 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F9A02166B27
	for <cluster-devel@redhat.com>; Sun, 22 Nov 2020 16:33:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 10EA580391A
	for <cluster-devel@redhat.com>; Sun, 22 Nov 2020 16:33:24 +0000 (UTC)
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
	[209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-74-5EZulonaPQyCLl46BsFh7g-1; Sun, 22 Nov 2020 11:33:22 -0500
X-MC-Unique: 5EZulonaPQyCLl46BsFh7g-1
Received: by mail-qv1-f71.google.com with SMTP id s8so11264421qvr.20
	for <cluster-devel@redhat.com>; Sun, 22 Nov 2020 08:33:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=eSFXaX0DZkpNbOwM/RCeF/BEd3n14fz/kurtk7pTmoY=;
	b=C1INKlgTCV+bzqVm7kQzzMMFQPfFIysIVFkGl085y+9+K7Pxqj8tpu5VEYYKieEdIG
	HyXRIHV2MI513w0wGhwoDRegmfxupv5iGUxFQqAsZtzMXrM4VHVv8Co1KdlcM0j3LCh3
	+NQ3DPqCiYOJxfuSPYo/atzFpj7ydVy2IExSXZ0EHl72YAv6hi4E1vvW6qow7DGYT7wQ
	yJIvMCi7HdTQ6JPd/3qCraxF3i+epQ3KV6mFfCEpGj1xAip5XJvnXJP1zDmOYjX61A/i
	ED+fC+WGksh5aXERP8xBKjQNzFismlxy2z0S1Id2ietXO7cd07Vt7K0NOcdjQkgBPCgX
	/b1Q==
X-Gm-Message-State: AOAM532OwVtJdUNHEwmqYGQ8WdWrUl7OBj4t97MR1+mw3ggiTmqET0T1
	ni6HCI8kHsLCwHvJwBuMuXfD4x/lOVPmeCKf4wJWEtkqsoZy0RUVNu66askS+c6zXufR+NLZX7P
	Ipn+4Wg8KfubBw3XqqUSRXg==
X-Received: by 2002:a37:a783:: with SMTP id q125mr25815201qke.10.1606062801571;
	Sun, 22 Nov 2020 08:33:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx2n++9V878KrbbQS+4X3uFT/lj12S/EG8yAhFKA6vFd9PzTR06otQkDsZPYmv5N+Hbwviu/A==
X-Received: by 2002:a37:a783:: with SMTP id q125mr25815168qke.10.1606062801138;
	Sun, 22 Nov 2020 08:33:21 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
	[75.142.250.213])
	by smtp.gmail.com with ESMTPSA id 9sm7113466qke.6.2020.11.22.08.33.17
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sun, 22 Nov 2020 08:33:20 -0800 (PST)
To: Joe Perches <joe@perches.com>, clang-built-linux@googlegroups.com
References: <20201121165058.1644182-1-trix@redhat.com>
	<2105f0c05e9eae8bee8e17dcc5314474b3c0bc73.camel@perches.com>
From: Tom Rix <trix@redhat.com>
Message-ID: <6e8c1926-4209-8f10-d0f9-72c875a85a88@redhat.com>
Date: Sun, 22 Nov 2020 08:33:16 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <2105f0c05e9eae8bee8e17dcc5314474b3c0bc73.camel@perches.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Mon, 23 Nov 2020 09:02:28 -0500
Cc: linux-hyperv@vger.kernel.org, kvm@vger.kernel.org,
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net, keyrings@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-scsi@vger.kernel.org,
	amd-gfx@lists.freedesktop.org, cluster-devel@redhat.com,
	linux-acpi@vger.kernel.org, tboot-devel@lists.sourceforge.net,
	coreteam@netfilter.org, xen-devel@lists.xenproject.org,
	MPT-FusionLinux.pdl@broadcom.com, linux-media@vger.kernel.org,
	alsa-devel@alsa-project.org, intel-gfx@lists.freedesktop.org,
	ecryptfs@vger.kernel.org, linux-omap@vger.kernel.org,
	devel@acpica.org, linux-nfs@vger.kernel.org,
	netdev@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-bluetooth@vger.kernel.org, netfilter-devel@vger.kernel.org,
	linux-crypto@vger.kernel.org, patches@opensource.cirrus.com,
	linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org
Subject: Re: [Cluster-devel] [RFC] MAINTAINERS tag for cleanup robot
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 11/21/20 9:10 AM, Joe Perches wrote:
> On Sat, 2020-11-21 at 08:50 -0800, trix@redhat.com wrote:
>> A difficult part of automating commits is composing the subsystem
>> preamble in the commit log.  For the ongoing effort of a fixer producing
>> one or two fixes a release the use of 'treewide:' does not seem appropriate.
>>
>> It would be better if the normal prefix was used.  Unfortunately normal is
>> not consistent across the tree.
>>
>> So I am looking for comments for adding a new tag to the MAINTAINERS file
>>
>> 	D: Commit subsystem prefix
>>
>> ex/ for FPGA DFL DRIVERS
>>
>> 	D: fpga: dfl:
> I'm all for it.  Good luck with the effort.  It's not completely trivial.
>
> From a decade ago:
>
> https://lore.kernel.org/lkml/1289919077.28741.50.camel@Joe-Laptop/
>
> (and that thread started with extra semicolon patches too)

Reading the history, how about this.

get_mataintainer.pl outputs a single prefix, if multiple files have the same prefix it works, if they don't its an error.

Another script 'commit_one_file.sh' does the call to get_mainainter.pl to get the prefix and be called by run-clang-tools.py to get the fixer specific message.

Defer minimizing the commits by combining similar subsystems till later.

In a steady state case, this should be uncommon.


>
>> Continuing with cleaning up clang's -Wextra-semi-stmt
>> diff --git a/Makefile b/Makefile
> []
>> @@ -1567,20 +1567,21 @@ help:
>>  	 echo  ''
>>  	@echo  'Static analysers:'
>>  	@echo  '  checkstack      - Generate a list of stack hogs'
>>  	@echo  '  versioncheck    - Sanity check on version.h usage'
>>  	@echo  '  includecheck    - Check for duplicate included header files'
>>  	@echo  '  export_report   - List the usages of all exported symbols'
>>  	@echo  '  headerdep       - Detect inclusion cycles in headers'
>>  	@echo  '  coccicheck      - Check with Coccinelle'
>>  	@echo  '  clang-analyzer  - Check with clang static analyzer'
>>  	@echo  '  clang-tidy      - Check with clang-tidy'
>> +	@echo  '  clang-tidy-fix  - Check and fix with clang-tidy'
> A pity the ordering of the code below isn't the same as the above.

Taken care thanks!

Tom


