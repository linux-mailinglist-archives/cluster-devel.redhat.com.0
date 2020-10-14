Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 92E7A28E110
	for <lists+cluster-devel@lfdr.de>; Wed, 14 Oct 2020 15:14:29 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-_2STxW3kNAaPge7kBWCO3w-1; Wed, 14 Oct 2020 09:14:26 -0400
X-MC-Unique: _2STxW3kNAaPge7kBWCO3w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E2C71018F65;
	Wed, 14 Oct 2020 13:14:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 23EEC7666B;
	Wed, 14 Oct 2020 13:14:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8CF6058100;
	Wed, 14 Oct 2020 13:14:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09EDEKRF032019 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 14 Oct 2020 09:14:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8CD992166BDD; Wed, 14 Oct 2020 13:14:20 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 879BB2166BB3
	for <cluster-devel@redhat.com>; Wed, 14 Oct 2020 13:14:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 56263858295
	for <cluster-devel@redhat.com>; Wed, 14 Oct 2020 13:14:18 +0000 (UTC)
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-489-0b7_Qwg8MqWcQya3E--7rw-1; Wed, 14 Oct 2020 09:14:14 -0400
X-MC-Unique: 0b7_Qwg8MqWcQya3E--7rw-1
Received: by mail-pg1-f195.google.com with SMTP id n9so1929637pgt.8;
	Wed, 14 Oct 2020 06:14:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=UawW9kr1VSlFsZgDsJocSNaJ6Xn7ZSJWICbrc18ExZo=;
	b=RXxNMwEMR8r7Vy27OTM4l43INlgddsRaCRidJFQACreDfLYVAYLqHCbOKO5S6Li3TT
	dKNNN7O8jjUkyCxLhdnIc5lIPPXQJ0o0TfbMz9HDDxobbAAu9YB9/GbGXz41C2ecTJ13
	HQPAptl6glxwHpqFF4GmqBnTwf4jUyLp8p/5J8igANOouv16Y8LRfVkbXpugfB4K4kXN
	Eb7x9w5ZV84jgl1onMAY13UD0iO4tSK59DIRQ7whzUfs2o33QLajbA4lGN4BbPW7Jkhn
	CUdkXxnVrIFyYG4Ygw5GnnDi0eDz+o+VgLFrXWn1+35Y0KQbibMEnECgmURsCjf2IkI5
	urWA==
X-Gm-Message-State: AOAM531RSYJmP+VS5/XVLneDVTxVYnie3HTM0jllvR4PQA9u2B4exrsW
	EYj79KWi1+W/RUO3Oq22Tpo=
X-Google-Smtp-Source: ABdhPJworPLHLh5PTrbbUgBQX2HKwQrgckVM4USyKQLbZcOTMHSKev+j9cMneIwyEplnuMSOiDJ0Hg==
X-Received: by 2002:aa7:9358:0:b029:152:b349:8af8 with SMTP id
	24-20020aa793580000b0290152b3498af8mr4352952pfn.9.1602681251951;
	Wed, 14 Oct 2020 06:14:11 -0700 (PDT)
Received: from [192.168.0.104] ([49.207.205.44])
	by smtp.gmail.com with ESMTPSA id p6sm3327907pjd.1.2020.10.14.06.14.08
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 14 Oct 2020 06:14:11 -0700 (PDT)
To: Andrew Price <anprice@redhat.com>
References: <20201013152648.438887-1-anant.thazhemadam@gmail.com>
	<d75dc535-00be-3aa7-addb-c2615b202b56@redhat.com>
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
Message-ID: <48a1f8ca-54ce-09f4-45c2-b1091d4e358a@gmail.com>
Date: Wed, 14 Oct 2020 18:44:06 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d75dc535-00be-3aa7-addb-c2615b202b56@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: Fox Chen <foxhlchen@gmail.com>, linux-kernel@vger.kernel.org,
	syzbot+a5e2482a693e6b1e444b@syzkaller.appspotmail.com,
	cluster-devel@redhat.com, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Cluster-devel] [PATCH] fs: gfs2: prevent OOB access in
 gfs2_read_sb()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 14/10/20 6:34 pm, Andrew Price wrote:
> On 13/10/2020 16:26, Anant Thazhemadam wrote:
>> In gfs2_read_sb(), if the condition
>>     (d != sdp->sd_heightsize[x - 1] || m)
>> isn't satisfied (in the first 11 iterations), the loop continues,
>> and begins to perform out-of-bounds access.
>> Fix this out-of-bounds access by introducing a condition in the for loop
>> that ensures that no more than GFS2_MAX_META_HEIGHT + 1 elements are
>> accessed.
>>
>> In addition to this, if the above condition is satisfied when
>> x = GFS2_MAX_META_HEIGHT (which = 10), and the flow of control breaks
>> out of the loop, then an out-of-bounds access is performed again while
>> assigning sdp->sd_heightsize[x] = ~0 (since x would be 11 now.), and
>> also the assertion that spd->sd_max_height <= GFS2_MAX_META_HEIGHT would
>> fail.
>> Fix this out-of-bounds access and ensure that the assertion doesn't fail
>> by introducing another variable "index", which keeps track of the last
>> valid value of x (pre-increment) that can be used.
>
> That's not quite the right approach. Your analysis below is correct: the problem stems from the block size in the superblock being zeroed by the fuzzer. So the correct fix would be to add a validation check for sb_bsize (gfs2_check_sb() is lacking somewhat). Valid values are powers of 2 between 512 and the page size.
>

I see. Thanks for the review! I'll send in a v2 that implements this check soon enough.

Thanks,
Anant

