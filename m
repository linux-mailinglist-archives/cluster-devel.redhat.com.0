Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 834C92C0C9B
	for <lists+cluster-devel@lfdr.de>; Mon, 23 Nov 2020 15:11:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1606140659;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=D4o3+oRulyAmQWJaTM5GlynW0/tmbkOzx3PzhPB5iTg=;
	b=M/5PGbglCRsql7FHfvcjIzo+5+LYI4QHC0lj0FzGWGL4/ZKgUDrHaGoSujGzJGPsbCw31A
	KZk9jy7tW+rCwV1ym9Xyi32q2f1h6KBhkzvwYCm9q38vOorIb4+LirZranMfAINDD2BIxt
	KzgA0kvyBY7roRtqj2vd1ac8iAj6KJA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-mGcR5VfDNni581Yb_S7dzQ-1; Mon, 23 Nov 2020 09:10:57 -0500
X-MC-Unique: mGcR5VfDNni581Yb_S7dzQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7286805BE7;
	Mon, 23 Nov 2020 14:10:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D6A465C1CF;
	Mon, 23 Nov 2020 14:10:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BE85C5002D;
	Mon, 23 Nov 2020 14:02:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AMGB4ML014723 for <cluster-devel@listman.util.phx.redhat.com>;
	Sun, 22 Nov 2020 11:11:04 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8295D2026D11; Sun, 22 Nov 2020 16:11:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7DB072026D48
	for <cluster-devel@redhat.com>; Sun, 22 Nov 2020 16:11:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 30C52858EEC
	for <cluster-devel@redhat.com>; Sun, 22 Nov 2020 16:11:02 +0000 (UTC)
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
	[209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-276-7M9p1HzMO7Wuxpv1OVei9Q-1; Sun, 22 Nov 2020 11:11:00 -0500
X-MC-Unique: 7M9p1HzMO7Wuxpv1OVei9Q-1
Received: by mail-qt1-f198.google.com with SMTP id y5so11738716qtb.13
	for <cluster-devel@redhat.com>; Sun, 22 Nov 2020 08:11:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=D4o3+oRulyAmQWJaTM5GlynW0/tmbkOzx3PzhPB5iTg=;
	b=Nmsii5r7mXt4KHA4SObkEwGqKZDtw/Vw74tL2Tfixfm31cm5eu/ru5MP5ApKIb6hgW
	tGfQK9EKQNHQ2Gt6wQQ93kAg7pMYnAlgaP9fS69C+HpYgsuSKqtuzuO7P2bDcnz5KD8Y
	MAtsitDYoD8MNvUs4bEJqntNSh1uJ+jn990OZ70eHlQmTSRvSnh79VGOh+JRgmAGy1qT
	L37mt7ZKE1nvfT+N6oo3lsWxYwPf6gVRyLNqASFo3MwbhKys6A0zJ88wAF9SeCI2q/iB
	5uz1FTphWerodKBn3jbb0ukWjqM7mbu89AgtxhDtuF+oNAFcxx+b+DRwfQnrmegoURGd
	DCmA==
X-Gm-Message-State: AOAM530wrWEhApIGRqDfUE6xbeSkpDMw4woE7QXCkzjMvUpIDijZnqMz
	3SsPjJdTKSigXtbC6q3CHJLfRpUflhfjV3duvPaTkvPNCEU2NxNMcu2hKEwPmUSZqVWZJ3Rj4d3
	FZZ9b+CkW3F2U4hGLvC72hA==
X-Received: by 2002:ac8:5a8c:: with SMTP id c12mr23364791qtc.97.1606061459262; 
	Sun, 22 Nov 2020 08:10:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw6JfmMkGlJyoaKx6ihYsYbDuDsWkyDwIosiC/apv5eylMrcIvHPxlHVgnFDCnun9WXh4UZ3w==
X-Received: by 2002:ac8:5a8c:: with SMTP id c12mr23364770qtc.97.1606061458997; 
	Sun, 22 Nov 2020 08:10:58 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
	[75.142.250.213])
	by smtp.gmail.com with ESMTPSA id l3sm2779806qth.13.2020.11.22.08.10.54
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sun, 22 Nov 2020 08:10:58 -0800 (PST)
To: Matthew Wilcox <willy@infradead.org>
References: <20201121165058.1644182-1-trix@redhat.com>
	<20201122032304.GE4327@casper.infradead.org>
	<ddb08a27-3ca1-fb2e-d51f-4b471f1a56a3@redhat.com>
	<20201122145635.GG4327@casper.infradead.org>
From: Tom Rix <trix@redhat.com>
Message-ID: <0819ce06-c462-d4df-d3d9-14931dc5aefc@redhat.com>
Date: Sun, 22 Nov 2020 08:10:53 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201122145635.GG4327@casper.infradead.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Mon, 23 Nov 2020 09:02:28 -0500
Cc: linux-hyperv@vger.kernel.org, kvm@vger.kernel.org,
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net, keyrings@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-scsi@vger.kernel.org,
	clang-built-linux@googlegroups.com,
	amd-gfx@lists.freedesktop.org, cluster-devel@redhat.com,
	linux-acpi@vger.kernel.org, tboot-devel@lists.sourceforge.net,
	coreteam@netfilter.org, xen-devel@lists.xenproject.org,
	MPT-FusionLinux.pdl@broadcom.com, linux-media@vger.kernel.org,
	alsa-devel@alsa-project.org, intel-gfx@lists.freedesktop.org,
	ecryptfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-omap@vger.kernel.org, devel@acpica.org,
	linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
	netfilter-devel@vger.kernel.org, linux-crypto@vger.kernel.org,
	patches@opensource.cirrus.com, joe@perches.com, bpf@vger.kernel.org
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 11/22/20 6:56 AM, Matthew Wilcox wrote:
> On Sun, Nov 22, 2020 at 06:46:46AM -0800, Tom Rix wrote:
>> On 11/21/20 7:23 PM, Matthew Wilcox wrote:
>>> On Sat, Nov 21, 2020 at 08:50:58AM -0800, trix@redhat.com wrote:
>>>> The fixer review is
>>>> https://reviews.llvm.org/D91789
>>>>
>>>> A run over allyesconfig for x86_64 finds 62 issues, 5 are false positives.
>>>> The false positives are caused by macros passed to other macros and by
>>>> some macro expansions that did not have an extra semicolon.
>>>>
>>>> This cleans up about 1,000 of the current 10,000 -Wextra-semi-stmt
>>>> warnings in linux-next.
>>> Are any of them not false-positives?  It's all very well to enable
>>> stricter warnings, but if they don't fix any bugs, they're just churn.
>>>
>> While enabling additional warnings may be a side effect of this effort
>>
>> the primary goal is to set up a cleaning robot. After that a refactoring robot.
> Why do we need such a thing?  Again, it sounds like more churn.
> It's really annoying when I'm working on something important that gets
> derailed by pointless churn.  Churn also makes it harder to backport
> patches to earlier kernels.
>
A refactoring example on moving to treewide, consistent use of a new api may help.

Consider

2efc459d06f1630001e3984854848a5647086232

sysfs: Add sysfs_emit and sysfs_emit_at to format sysfs output

A new api for printing in the sysfs.  How do we use it treewide ?

Done manually, it would be a heroic effort requiring high level maintainers pushing and likely only get partially done.

If a refactoring programatic fixit is done and validated on a one subsystem, it can run on all the subsystems.

The effort is a couple of weeks to write and validate the fixer, hours to run over the tree.

It won't be perfect but will be better than doing it manually.

Tom

