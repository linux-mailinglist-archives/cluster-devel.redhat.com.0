Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F14634844C1
	for <lists+cluster-devel@lfdr.de>; Tue,  4 Jan 2022 16:35:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1641310553;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vnq1xNljNBtbfcaw2PcGAv3Qr2jgOovBqk8dFpsZXT8=;
	b=Qwr/CRXgRCgcmExpFHAc7eSmF0Cnigtd5ofFYiIUgpVaREjAcS0t0Bf+/QeEMoP+a4z59M
	TQOGPzHlRapCnf8iQQK/Xvs3xqNpg/V6rqK26dUlvqhuwsXXEuSc2Agm4qYWNNfrRtj9Q/
	9Ez1KgZHzVAGqrWCjOeIpuds6raN4Yc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-n7qGvdWvM5eJn5ITXhIs2A-1; Tue, 04 Jan 2022 10:35:49 -0500
X-MC-Unique: n7qGvdWvM5eJn5ITXhIs2A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42FB169737;
	Tue,  4 Jan 2022 15:35:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A5B4A7B6F0;
	Tue,  4 Jan 2022 15:35:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6C45E4BB7C;
	Tue,  4 Jan 2022 15:35:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
	[10.11.54.9])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 204FZaos031500 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 4 Jan 2022 10:35:36 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9292C492CAC; Tue,  4 Jan 2022 15:35:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8EB2B492CA9
	for <cluster-devel@redhat.com>; Tue,  4 Jan 2022 15:35:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 721B11064FAF
	for <cluster-devel@redhat.com>; Tue,  4 Jan 2022 15:35:36 +0000 (UTC)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
	[209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-385-bGk7WWArOBSq2trxHy4r4w-1; Tue, 04 Jan 2022 10:35:35 -0500
X-MC-Unique: bGk7WWArOBSq2trxHy4r4w-1
Received: by mail-wr1-f71.google.com with SMTP id
	s23-20020adf9797000000b001a24674f0f7so11851580wrb.9
	for <cluster-devel@redhat.com>; Tue, 04 Jan 2022 07:35:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:message-id:date:mime-version:user-agent
	:content-language:to:from:subject:content-transfer-encoding;
	bh=vnq1xNljNBtbfcaw2PcGAv3Qr2jgOovBqk8dFpsZXT8=;
	b=lhXbHbd3bf+3YHsCirqNLUptFf81pnNX/7Iry6i1l7zhpKRXu8QHAi6+J0ygNyLNmu
	0EHWyjfePMxmR14p02IlVh/GxWXZgQPSLC6avy8Ls+B9q4lCT117CiHyWsOSv0QkJq/o
	epWhYshJeC+aB9bZAB26D7d6E2amYkzX8NIf4lBJf3rg/wLvT3I6vXqCgixwBrPUcW80
	/5B2+kbphPEvVACNsumPAyiae90cQB7TfbDW5LpqqSNBCLardVGWNryBfdCEzFDGuVJU
	AzcLhix+FeAwaVcHQXSKQNwh9aHzXi0X1FWW7iPW/6W0EGi7pDCZA6c0b46rh0oN0ODO
	A/Iw==
X-Gm-Message-State: AOAM531Hks/2ZXUe0pVZMs8dJa450taeoqc0LHPxLtIecXmUx0qOSuB4
	eRE0CSH0S2JuVGLYXISeALm3mE3fVA+UR0rkrPXFGYutlCciFxomGAkv3LGPuYbxFanE0kcVFTK
	Ulm3RP0gH72iEh2aKLa1Ky5VNMRMZNdhQC7sGwii/W9LkntJpfc5PrYfU4brRM2LSMFyNuREH
X-Received: by 2002:adf:aac7:: with SMTP id i7mr43450329wrc.537.1641310534114; 
	Tue, 04 Jan 2022 07:35:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwRntoMbw4OQ6EtiWCX+d8AKEQuP13OR431rYAr3NwGtE+1ttb+jiPa7e2VadEnc8Ovtg2OSw==
X-Received: by 2002:adf:aac7:: with SMTP id i7mr43450317wrc.537.1641310533904; 
	Tue, 04 Jan 2022 07:35:33 -0800 (PST)
Received: from [192.168.1.145]
	(cpc76484-cwma10-2-0-cust967.7-3.cable.virginm.net. [82.31.203.200])
	by smtp.gmail.com with ESMTPSA id
	b13sm39111747wrh.32.2022.01.04.07.35.33
	for <cluster-devel@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 04 Jan 2022 07:35:33 -0800 (PST)
Message-ID: <e9a2e359-685c-2497-d2bf-e36e2c474c7b@redhat.com>
Date: Tue, 4 Jan 2022 15:35:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
	Thunderbird/91.3.0
To: cluster-devel <cluster-devel@redhat.com>
From: Andrew Price <anprice@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] Upcoming change to the gfs2-utils.git repository
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Happy new year, all!

Just a heads-up that the main branch in gfs2-utils.git will be renamed 
from master to main tomorrow (January 5). I will follow the procedure here:

   https://wiki.clusterlabs.org/wiki/How_to_rename_git_default_branch

The wiki page also has a section on how to update your local clone to 
use the new upstream branch name. Thanks to Ken for writing that up!

This change affects https://pagure.io/gfs2-utils.git

I will post a follow-up once the change has been completed.

Cheers,
Andy

