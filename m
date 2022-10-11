Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F6C5FBBE7
	for <lists+cluster-devel@lfdr.de>; Tue, 11 Oct 2022 22:12:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665519126;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=mBCyAW+INIk97qkLgDzPBSuktm9tDmQTnvrDcqdwFdY=;
	b=TkAUTTvtVkglQBw6lICHqLkOP6Vsve629X6kIIz2HlvvYCbhxjTmYtaAFJwIcJScoFWpwp
	9yGKCiziM1TjwmoE6+tVFt/VYmsBy9GdrZIfghMirwrT+AZ7P1b63wkvXiHiRUdKs2ie8+
	4sMvvM44QSRYIeE+vnVz6ZJspMZA+Fw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-P7G5G96yMR2i_F_qRRnEmw-1; Tue, 11 Oct 2022 16:12:04 -0400
X-MC-Unique: P7G5G96yMR2i_F_qRRnEmw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 43639299E777;
	Tue, 11 Oct 2022 20:12:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 317012166B2F;
	Tue, 11 Oct 2022 20:12:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0401219465A2;
	Tue, 11 Oct 2022 20:11:59 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8F841194658F for <cluster-devel@listman.corp.redhat.com>;
 Tue, 11 Oct 2022 20:11:57 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2768B112131E; Tue, 11 Oct 2022 20:11:57 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2042A112131B
 for <cluster-devel@redhat.com>; Tue, 11 Oct 2022 20:11:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 000833C021A4
 for <cluster-devel@redhat.com>; Tue, 11 Oct 2022 20:11:56 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-433-Rbh_tJTUOi2awKek6Wnahw-1; Tue, 11 Oct 2022 16:11:53 -0400
X-MC-Unique: Rbh_tJTUOi2awKek6Wnahw-1
Received: by mail-pl1-f175.google.com with SMTP id n7so14291925plp.1;
 Tue, 11 Oct 2022 13:11:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mBCyAW+INIk97qkLgDzPBSuktm9tDmQTnvrDcqdwFdY=;
 b=KvuljkGWkAVCra83qf5g/Xa75mVcUPaxdVUMt1UNTqokrTQ+hHdp+YNNl0aBdTJhnz
 zGVp4QCiB8QgV6URSYZIvQxe2dKqRMJLspyQgvyFTID4dAthviceTnNavth0nhvnIL9M
 hCFFXdV1XGjgJaqoPOj69/rtIwFNJ04GkdCLdVC7Sy2DKS9zjyeXbUL5prKDKR9qIsjA
 aKsmeT75pvt3s9wJ6ArL6SbWMaiWZTPmZRm4jVm5NEtt5Md/wpAVYOEmbcFyF5iFZe5n
 cLy1IuoP1CasJezO4SY6NJ+CmDaXgj9NyYagZYpeTquJACIQB9mjMCuliR9yCQFuKtmv
 +GJw==
X-Gm-Message-State: ACrzQf3g8CjoV/Au2Ad0/pVi3BJM05390Iw7Dj38X24BOL1ElS+AWTFv
 hjgwTGmIHVNbLbESUDmZmnmj4MAR12Ew6A==
X-Google-Smtp-Source: AMsMyM7F1iCyF0evOIhoqF1XoSiOdl4sOwS9KWU2FbBLwXllY8ofMR4g69lCAXCxoF1D1OH28H31Bw==
X-Received: by 2002:a17:902:724a:b0:177:fd96:37bf with SMTP id
 c10-20020a170902724a00b00177fd9637bfmr24471774pll.25.1665519112138; 
 Tue, 11 Oct 2022 13:11:52 -0700 (PDT)
Received: from mail.google.com (122-58-209-93-fibre.sparkbb.co.nz.
 [122.58.209.93]) by smtp.gmail.com with ESMTPSA id
 x6-20020a170902a38600b00178b9c997e5sm9076452pla.138.2022.10.11.13.11.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 13:11:50 -0700 (PDT)
Date: Wed, 12 Oct 2022 09:11:44 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: Kees Cook <keescook@chromium.org>
Message-ID: <Y0XOAAOLPfj/VHco@mail.google.com>
References: <Y0W5jkiXUkpNl4ap@mail.google.com>
 <Y0XMP2RMkE4MWNPE@mail.google.com> <202210111305.743F591@keescook>
MIME-Version: 1.0
In-Reply-To: <202210111305.743F591@keescook>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [Cluster-devel] [PATCH v4] [next] dlm: replace one-element
 array with fixed size array
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
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 11, 2022 at 01:06:32PM -0700, Kees Cook wrote:
> On Wed, Oct 12, 2022 at 09:04:15AM +1300, Paulo Miguel Almeida wrote:
> >  	error = -ENOMEM;
> >  
> > -	ls = kzalloc(sizeof(struct dlm_ls) + namelen, GFP_NOFS);
> > +	ls = kzalloc(sizeof(struct dlm_ls), GFP_NOFS);
>                      ^^^^^^^^^^^^^^^^^^^^
> I think you forgot the suggestion Gustavo had here. :) Preferred style would
> be:
> 	sizeof(*ls)
> 
Ooops, I hadn't seen that one =O 

Alright, v5 in the making

Paulo A.

