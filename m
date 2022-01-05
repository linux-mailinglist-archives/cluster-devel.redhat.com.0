Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B864851F0
	for <lists+cluster-devel@lfdr.de>; Wed,  5 Jan 2022 12:38:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1641382728;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+vHwDT/aKRFFDaAf2/JamosH2QZL5R3IzT+xHO4O5Jg=;
	b=NNwND+tR4R2AaR4rnIWBSDeCrIxVQvgBzDXgQUSbZ8tpDGWRqEx/+VWzitGKf/KEDUCmeq
	1DWP4fWuOMKJW3398kE/kSJrzc9wgTanRQb4VokLH65XucQoKGzWBR2mS31FMotmO1NTiZ
	kl0SzZJDgWnuqyV0lR4vyYK8o0ThMnc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-502-0axatIA6Ptu7CzbRM6b1PA-1; Wed, 05 Jan 2022 06:38:45 -0500
X-MC-Unique: 0axatIA6Ptu7CzbRM6b1PA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 222AE10168C7;
	Wed,  5 Jan 2022 11:38:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ADFF11079F21;
	Wed,  5 Jan 2022 11:38:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1577A1809CB8;
	Wed,  5 Jan 2022 11:38:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 205BcYUh012587 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 5 Jan 2022 06:38:34 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5938653C9; Wed,  5 Jan 2022 11:38:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 53FB753C6
	for <cluster-devel@redhat.com>; Wed,  5 Jan 2022 11:38:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3C65E3C01DAF
	for <cluster-devel@redhat.com>; Wed,  5 Jan 2022 11:38:31 +0000 (UTC)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
	[209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-422-grYiXolcObahll36gQIA6Q-1; Wed, 05 Jan 2022 06:38:30 -0500
X-MC-Unique: grYiXolcObahll36gQIA6Q-1
Received: by mail-wr1-f69.google.com with SMTP id
	j26-20020adfb31a000000b001a2356afd4fso12466799wrd.21
	for <cluster-devel@redhat.com>; Wed, 05 Jan 2022 03:38:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
	:content-language:from:to:references:in-reply-to
	:content-transfer-encoding;
	bh=+vHwDT/aKRFFDaAf2/JamosH2QZL5R3IzT+xHO4O5Jg=;
	b=GYnRWPHERLgxwAfrBH8HEND9M6WeBGtZdzhLhKP/fr+VNlYOR4BNYRhuSxYK65T/8K
	yJy4ymFvq5JXIRr+fRo2593jCOjkdBJgAmIwXDEbirqog8Of1qsKYFkRPab8s8aPpw8r
	MvbqczHgEMQCrNJJxlymiTMI+XBEAO5OXgu6otL2Cz4L7ZGaE5PU0SwO+hHMycqf9ud/
	QgTsGgO8tp7lKjop7MAuENQIii8TfKwA4OYulCyeSNztwvGUdU34o4FvHiPlvLcbNJVG
	TWVCGYJI5XAaBqAsLaAFt5w00nqeV1XCCeE+dYhYjj+p4XUJTBbnLZmy8C9Y6t3nHnMj
	ldtQ==
X-Gm-Message-State: AOAM530BEB3g2xdIQE65RoI17FB+hielhVnv04i5HwUBuBIt8N62Jdq/
	XJHm7Nr/3MUmoqjdrW3/kiRsGmxqpR9e3s8Ef7cbikylEesWFMeguBjWCIUGsz73d+KNsY6gXqO
	cS58zstGwxohh8WHuLHpmapi6Fm1T43QiNXz6Qx5chV+Y3beccg9Joq1mGhXm0Wve+38qWJt2
X-Received: by 2002:adf:9bdb:: with SMTP id e27mr46564009wrc.417.1641382708802;
	Wed, 05 Jan 2022 03:38:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxes8pzzPihUlgW0bFhzY3A/qSk0hwlNNDipI7RmeXV6wR0ZsVSpx6ceqiHiZH0OzcjN3X2QQ==
X-Received: by 2002:adf:9bdb:: with SMTP id e27mr46563993wrc.417.1641382708557;
	Wed, 05 Jan 2022 03:38:28 -0800 (PST)
Received: from [192.168.1.145]
	(cpc76484-cwma10-2-0-cust967.7-3.cable.virginm.net. [82.31.203.200])
	by smtp.gmail.com with ESMTPSA id
	o15sm35609128wri.106.2022.01.05.03.38.28
	for <cluster-devel@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 05 Jan 2022 03:38:28 -0800 (PST)
Message-ID: <ee27de6f-d41b-7acd-03ed-fbe525c80a97@redhat.com>
Date: Wed, 5 Jan 2022 11:38:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
	Thunderbird/91.4.0
From: Andrew Price <anprice@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
References: <e9a2e359-685c-2497-d2bf-e36e2c474c7b@redhat.com>
In-Reply-To: <e9a2e359-685c-2497-d2bf-e36e2c474c7b@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] Upcoming change to the gfs2-utils.git repository
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 04/01/2022 15:35, Andrew Price wrote:
> Happy new year, all!
> 
> Just a heads-up that the main branch in gfs2-utils.git will be renamed 
> from master to main tomorrow (January 5). I will follow the procedure here:
> 
>    https://wiki.clusterlabs.org/wiki/How_to_rename_git_default_branch
> 
> The wiki page also has a section on how to update your local clone to 
> use the new upstream branch name. Thanks to Ken for writing that up!
> 
> This change affects https://pagure.io/gfs2-utils.git
> 
> I will post a follow-up once the change has been completed.

This change is now complete. To update your gfs2-utils git branch 
references locally, use:

   $ git branch --set-upstream-to origin/main <branch>

for <branch>es that currently have origin/master as the remote ref.

To rename your local master branch to main:

   $ git branch -m master main

Cheers,
Andy

